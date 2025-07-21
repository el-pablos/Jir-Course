# 🔍 Reconnaissance Techniques

> **Original Technical Content**: Sekiya
> **Compiled and Summarized by**: Tamas

## 📋 Overview

Reconnaissance adalah tahap pertama dan paling penting dalam penetration testing. Tujuannya adalah mengumpulkan sebanyak mungkin informasi tentang target tanpa terdeteksi. Semakin banyak informasi yang dikumpulkan, semakin besar peluang menemukan celah keamanan.

## ⚠️ Disclaimer

Teknik ini hanya untuk penetration testing yang legal dan tujuan edukasi. Pastikan Anda memiliki izin untuk melakukan reconnaissance pada target.

## 🎯 Tujuan Reconnaissance

- 🌐 **Domain & Subdomain Discovery**: Menemukan semua aset digital target
- 🔍 **Service Enumeration**: Mengidentifikasi layanan yang berjalan
- 📊 **Technology Stack**: Mengetahui teknologi yang digunakan
- 👥 **People & Email**: Informasi karyawan dan kontak
- 🗂️ **Sensitive Information**: File dan data yang terbuka

## 🔧 Passive Reconnaissance

### 1. Domain Information Gathering

#### WHOIS Lookup:
```bash
# Basic WHOIS
whois target.com

# Detailed WHOIS with specific server
whois -h whois.internic.net target.com

# WHOIS for IP address
whois 8.8.8.8

# Bulk WHOIS
cat domains.txt | while read domain; do
    echo "=== $domain ==="
    whois "$domain" | grep -E "(Registrar|Creation Date|Expiry|Name Server)"
    echo
done
```

#### DNS Information:
```bash
# Basic DNS lookup
nslookup target.com

# Detailed DNS records
dig target.com ANY

# Specific record types
dig target.com A      # IPv4 addresses
dig target.com AAAA   # IPv6 addresses
dig target.com MX     # Mail servers
dig target.com NS     # Name servers
dig target.com TXT    # Text records
dig target.com SOA    # Start of Authority

# Reverse DNS lookup
dig -x 8.8.8.8

# DNS zone transfer (rarely works)
dig @ns1.target.com target.com AXFR
```

### 2. Subdomain Enumeration

#### Subfinder:
```bash
# Basic usage
subfinder -d target.com

# Save to file
subfinder -d target.com -o subdomains.txt

# Multiple domains
subfinder -dL domains.txt -o all_subdomains.txt

# Use specific sources
subfinder -d target.com -sources crtsh,virustotal,shodan

# Silent mode
subfinder -d target.com -silent
```

#### Amass:
```bash
# Basic enumeration
amass enum -d target.com

# Passive enumeration only
amass enum -passive -d target.com

# With brute force
amass enum -brute -d target.com

# Output to file
amass enum -d target.com -o amass_results.txt

# Multiple domains
amass enum -df domains.txt
```

#### Assetfinder:
```bash
# Basic usage
assetfinder target.com

# Find subdomains only
assetfinder --subs-only target.com

# Multiple targets
cat domains.txt | assetfinder
```

#### Certificate Transparency:
```bash
# Using crt.sh
curl -s "https://crt.sh/?q=%25.target.com&output=json" | jq -r '.[].name_value' | sort -u

# Using certspotter
curl -s "https://certspotter.com/api/v1/issuances?domain=target.com&include_subdomains=true&expand=dns_names" | jq -r '.[].dns_names[]' | sort -u
```

### 3. Search Engine Reconnaissance

#### Google Dorking:
```bash
# Basic site search
site:target.com

# Find admin panels
site:target.com inurl:admin
site:target.com inurl:login
site:target.com inurl:dashboard

# Find sensitive files
site:target.com filetype:pdf
site:target.com filetype:doc
site:target.com filetype:xls
site:target.com ext:sql
site:target.com ext:log

# Find backup files
site:target.com inurl:backup
site:target.com intitle:"index of" backup

# Find configuration files
site:target.com filetype:conf
site:target.com filetype:config
site:target.com filetype:ini

# Find database files
site:target.com filetype:sql
site:target.com filetype:db

# Error messages
site:target.com "sql error"
site:target.com "mysql error"
site:target.com "warning: mysql"

# Directory listings
site:target.com intitle:"index of"
site:target.com intitle:"directory listing"

# Login pages
site:target.com inurl:login
site:target.com inurl:signin
site:target.com inurl:auth
```

#### Bing Dorking:
```bash
# IP range search
ip:192.168.1.1-192.168.1.254

# Find subdomains
domain:target.com

# File types
site:target.com filetype:pdf
```

#### Shodan:
```bash
# Install shodan CLI
pip install shodan
shodan init YOUR_API_KEY

# Search by hostname
shodan host target.com

# Search by organization
shodan search "org:Target Company"

# Search by service
shodan search "apache target.com"

# Search by port
shodan search "port:22 target.com"

# Download results
shodan download target_results "org:Target Company"
```

## 🔧 Active Reconnaissance

### 1. Port Scanning

#### Nmap Basic Scans:
```bash
# Basic TCP scan
nmap target.com

# Scan specific ports
nmap -p 80,443,22,21 target.com

# Scan port range
nmap -p 1-1000 target.com

# Scan all ports
nmap -p- target.com

# Fast scan (top 100 ports)
nmap -F target.com

# UDP scan
nmap -sU target.com
```

#### Nmap Advanced Scans:
```bash
# Service version detection
nmap -sV target.com

# OS detection
nmap -O target.com

# Script scanning
nmap -sC target.com

# Aggressive scan
nmap -A target.com

# Stealth scan
nmap -sS target.com

# No ping scan
nmap -Pn target.com

# Custom timing
nmap -T4 target.com  # T0-T5 (slowest to fastest)
```

#### Masscan:
```bash
# Fast port scan
masscan -p1-65535 target.com --rate=1000

# Specific ports
masscan -p80,443,22,21 target.com --rate=1000

# Save results
masscan -p1-65535 target.com --rate=1000 -oG masscan_results.txt

# Scan multiple targets
masscan -p80,443 -iL targets.txt --rate=1000
```

### 2. Service Enumeration

#### HTTP/HTTPS Services:
```bash
# Check if service is alive
httpx -l targets.txt

# Get titles and status codes
httpx -l targets.txt -title -status-code

# Technology detection
httpx -l targets.txt -tech-detect

# Screenshot
httpx -l targets.txt -screenshot

# Custom headers
httpx -l targets.txt -H "User-Agent: Custom"
```

#### Web Technology Detection:
```bash
# WhatWeb
whatweb target.com

# Batch scanning
whatweb -i targets.txt

# Verbose output
whatweb -v target.com

# Wappalyzer (browser extension)
# Install from Chrome/Firefox store
```

### 3. Directory & File Discovery

#### Dirsearch:
```bash
# Basic directory search
dirsearch -u https://target.com

# Custom wordlist
dirsearch -u https://target.com -w /path/to/wordlist.txt

# Specific extensions
dirsearch -u https://target.com -e php,html,js

# Recursive search
dirsearch -u https://target.com -r

# Multiple targets
dirsearch -l targets.txt
```

#### Ffuf:
```bash
# Directory fuzzing
ffuf -w /path/to/wordlist.txt -u https://target.com/FUZZ

# File extension fuzzing
ffuf -w /path/to/wordlist.txt -u https://target.com/FUZZ.php

# Subdomain fuzzing
ffuf -w /path/to/subdomains.txt -u https://FUZZ.target.com

# Parameter fuzzing
ffuf -w /path/to/params.txt -u https://target.com/page?FUZZ=value

# POST data fuzzing
ffuf -w /path/to/wordlist.txt -X POST -d "username=admin&password=FUZZ" -u https://target.com/login
```

#### Gobuster:
```bash
# Directory busting
gobuster dir -u https://target.com -w /path/to/wordlist.txt

# DNS subdomain enumeration
gobuster dns -d target.com -w /path/to/subdomains.txt

# Virtual host discovery
gobuster vhost -u https://target.com -w /path/to/vhosts.txt
```

## 📁 Struktur Direktori

- **[subdomain-enumeration/](./subdomain-enumeration/)**: Tools dan script untuk subdomain discovery
- **[port-scanning/](./port-scanning/)**: Nmap scripts dan port scanning techniques
- **[google-dorking/](./google-dorking/)**: Google dork lists dan automation

## 🛠️ Essential Tools Installation

```bash
# Go tools
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/tomnomnom/assetfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/ffuf/ffuf@latest

# Python tools
pip3 install shodan

# System tools (Ubuntu/Debian)
sudo apt install nmap whois dnsutils curl jq

# Amass
sudo snap install amass

# Dirsearch
git clone https://github.com/maurosoria/dirsearch.git

# Gobuster
sudo apt install gobuster

# Masscan
sudo apt install masscan
```

## 🎯 Reconnaissance Workflow

### 1. Complete Recon Script:
```bash
#!/bin/bash
TARGET=$1

echo "[+] Starting reconnaissance for $TARGET"

# Create output directory
mkdir -p recon_$TARGET
cd recon_$TARGET

# 1. Subdomain enumeration
echo "[+] Finding subdomains..."
subfinder -d $TARGET -silent | tee subdomains.txt
assetfinder $TARGET | tee -a subdomains.txt
sort -u subdomains.txt -o subdomains.txt

# 2. Check live subdomains
echo "[+] Checking live subdomains..."
cat subdomains.txt | httpx -silent | tee live_subdomains.txt

# 3. Port scanning
echo "[+] Port scanning..."
nmap -iL live_subdomains.txt -oN nmap_results.txt

# 4. Technology detection
echo "[+] Technology detection..."
cat live_subdomains.txt | httpx -tech-detect | tee tech_results.txt

# 5. Directory discovery
echo "[+] Directory discovery..."
cat live_subdomains.txt | while read url; do
    echo "Scanning: $url"
    dirsearch -u $url -e php,html,js --simple-report=dirsearch_$(echo $url | sed 's/https\?:\/\///g' | tr '/' '_').txt
done

echo "[+] Reconnaissance completed!"
```

## ⚡ Pro Tips

### 1. Stealth Considerations:
- Gunakan VPN atau proxy chains
- Randomize User-Agent strings
- Add delays between requests
- Use distributed scanning

### 2. Data Organization:
```bash
# Create organized structure
mkdir -p recon/{subdomains,ports,directories,technologies,screenshots}

# Use consistent naming
target_subdomains.txt
target_ports.txt
target_directories.txt
```

### 3. Automation & Monitoring:
- Set up continuous monitoring untuk new subdomains
- Use APIs untuk automated data collection
- Create custom dashboards untuk tracking

### 4. OSINT Sources:
- Certificate Transparency logs
- DNS databases
- Social media platforms
- Job postings
- GitHub repositories
- Pastebin sites

---

**Next**: [07-Vulnerability-Analysis](../07-Vulnerability-Analysis/) - Analisis dan identifikasi kerentanan
