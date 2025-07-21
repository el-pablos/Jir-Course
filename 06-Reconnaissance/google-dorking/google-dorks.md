# 🔍 Google Dorking Collection

> **Original Technical Content**: Sekiya
> **Compiled and Summarized by**: Tamas

## 📋 Overview

Google Dorking adalah teknik menggunakan operator pencarian Google untuk menemukan informasi sensitif yang tidak seharusnya dapat diakses publik. Daftar ini berisi berbagai Google dorks yang berguna untuk reconnaissance.

## ⚠️ Disclaimer

Gunakan Google dorks ini hanya untuk target yang Anda miliki atau memiliki izin untuk testing. Penggunaan ilegal adalah tanggung jawab pengguna.

## 🎯 Basic Site Reconnaissance

### Site Information
```
site:target.com
site:*.target.com
site:target.com -www
```

### Technology Stack
```
site:target.com "powered by"
site:target.com "built with"
site:target.com "running on"
site:target.com intext:"Apache"
site:target.com intext:"nginx"
site:target.com intext:"IIS"
```

## 🔐 Admin & Login Pages

### Admin Panels
```
site:target.com inurl:admin
site:target.com inurl:administrator
site:target.com inurl:admin.php
site:target.com inurl:admin/
site:target.com inurl:wp-admin
site:target.com inurl:adminpanel
site:target.com inurl:cpanel
site:target.com inurl:control
site:target.com inurl:controlpanel
site:target.com inurl:admincp
```

### Login Pages
```
site:target.com inurl:login
site:target.com inurl:signin
site:target.com inurl:sign-in
site:target.com inurl:log-in
site:target.com inurl:auth
site:target.com inurl:authentication
site:target.com inurl:sso
site:target.com "login" | "log in"
site:target.com intitle:"login"
site:target.com intitle:"sign in"
```

### Dashboard & Management
```
site:target.com inurl:dashboard
site:target.com inurl:panel
site:target.com inurl:console
site:target.com inurl:management
site:target.com inurl:manager
site:target.com intitle:"dashboard"
```

## 📁 Sensitive Files & Directories

### Configuration Files
```
site:target.com filetype:conf
site:target.com filetype:config
site:target.com filetype:ini
site:target.com filetype:xml
site:target.com filetype:yml
site:target.com filetype:yaml
site:target.com ext:conf
site:target.com ext:config
site:target.com "config.php"
site:target.com "configuration.php"
site:target.com "settings.php"
```

### Database Files
```
site:target.com filetype:sql
site:target.com filetype:db
site:target.com filetype:dbf
site:target.com filetype:mdb
site:target.com ext:sql
site:target.com "database"
site:target.com "db_"
site:target.com ".sql"
```

### Backup Files
```
site:target.com filetype:bak
site:target.com filetype:backup
site:target.com filetype:old
site:target.com filetype:orig
site:target.com ext:bak
site:target.com inurl:backup
site:target.com intitle:"index of" backup
site:target.com "backup"
site:target.com ".bak"
site:target.com ".old"
```

### Log Files
```
site:target.com filetype:log
site:target.com ext:log
site:target.com inurl:log
site:target.com "access.log"
site:target.com "error.log"
site:target.com "debug.log"
site:target.com ".log"
```

## 📄 Document Files

### Office Documents
```
site:target.com filetype:doc
site:target.com filetype:docx
site:target.com filetype:xls
site:target.com filetype:xlsx
site:target.com filetype:ppt
site:target.com filetype:pptx
site:target.com filetype:pdf
site:target.com filetype:rtf
```

### Text Files
```
site:target.com filetype:txt
site:target.com filetype:csv
site:target.com ext:txt
site:target.com "passwords.txt"
site:target.com "users.txt"
site:target.com "readme.txt"
```

## 🔍 Directory Listings

### Open Directories
```
site:target.com intitle:"index of"
site:target.com intitle:"directory listing"
site:target.com intitle:"index of /" 
site:target.com "parent directory"
site:target.com inurl:"index of"
```

### Specific Directories
```
site:target.com intitle:"index of" admin
site:target.com intitle:"index of" backup
site:target.com intitle:"index of" config
site:target.com intitle:"index of" database
site:target.com intitle:"index of" logs
site:target.com intitle:"index of" uploads
site:target.com intitle:"index of" files
```

## ⚠️ Error Messages & Debug Info

### Error Pages
```
site:target.com "sql error"
site:target.com "mysql error"
site:target.com "warning: mysql"
site:target.com "error in your SQL syntax"
site:target.com "ORA-" error
site:target.com "Microsoft OLE DB Provider for ODBC Drivers error"
site:target.com "PostgreSQL query failed"
```

### Debug Information
```
site:target.com "Warning:"
site:target.com "Fatal error:"
site:target.com "Notice:"
site:target.com "Debug"
site:target.com "stack trace"
site:target.com "call stack"
```

### Server Information
```
site:target.com "server at"
site:target.com "apache server at"
site:target.com "nginx"
site:target.com "server status"
site:target.com "/server-status"
site:target.com "/server-info"
```

## 🔑 Credentials & Sensitive Data

### Password Files
```
site:target.com "password"
site:target.com "passwd"
site:target.com "pwd"
site:target.com "credentials"
site:target.com "username"
site:target.com "user:"
site:target.com "pass:"
```

### API Keys & Tokens
```
site:target.com "api_key"
site:target.com "apikey"
site:target.com "api key"
site:target.com "access_token"
site:target.com "auth_token"
site:target.com "secret_key"
site:target.com "private_key"
```

### Database Credentials
```
site:target.com "DB_PASSWORD"
site:target.com "DB_USER"
site:target.com "database_password"
site:target.com "mysql_password"
site:target.com "root@localhost"
```

## 🌐 Web Applications

### WordPress
```
site:target.com inurl:wp-content
site:target.com inurl:wp-admin
site:target.com inurl:wp-includes
site:target.com "wp-config.php"
site:target.com "/wp-admin/install.php"
site:target.com inurl:wp-login.php
```

### Joomla
```
site:target.com inurl:administrator
site:target.com "/administrator/"
site:target.com "joomla"
site:target.com "index.php?option=com_"
```

### Drupal
```
site:target.com inurl:user/login
site:target.com "drupal"
site:target.com inurl:node/
site:target.com "/user/register"
```

### phpMyAdmin
```
site:target.com inurl:phpmyadmin
site:target.com "phpMyAdmin"
site:target.com "Welcome to phpMyAdmin"
site:target.com intitle:"phpMyAdmin"
```

## 📱 Specific Technologies

### Git Repositories
```
site:target.com inurl:.git
site:target.com filetype:git
site:target.com "/.git/"
site:target.com intitle:"index of" .git
```

### SVN Repositories
```
site:target.com inurl:.svn
site:target.com "/.svn/"
site:target.com intitle:"index of" .svn
```

### Environment Files
```
site:target.com ".env"
site:target.com filetype:env
site:target.com ".env.local"
site:target.com ".env.production"
```

## 🔧 Development & Testing

### Development Files
```
site:target.com "test"
site:target.com "dev"
site:target.com "development"
site:target.com "staging"
site:target.com "beta"
site:target.com inurl:test
site:target.com inurl:dev
```

### Source Code
```
site:target.com filetype:php
site:target.com filetype:asp
site:target.com filetype:aspx
site:target.com filetype:jsp
site:target.com filetype:py
site:target.com filetype:pl
```

## 📊 Business Intelligence

### Email Addresses
```
site:target.com "@target.com"
site:target.com "email"
site:target.com "contact"
site:target.com "mailto:"
```

### Phone Numbers
```
site:target.com "phone"
site:target.com "tel:"
site:target.com "call"
site:target.com "+62" (Indonesia)
site:target.com "+1" (US)
```

### Social Media
```
site:target.com "facebook.com"
site:target.com "twitter.com"
site:target.com "linkedin.com"
site:target.com "instagram.com"
```

## 🎯 Advanced Dorks

### Parameter Discovery
```
site:target.com inurl:?
site:target.com inurl:?id=
site:target.com inurl:?page=
site:target.com inurl:?file=
site:target.com inurl:?path=
site:target.com inurl:?url=
```

### Vulnerable Parameters
```
site:target.com inurl:?id= intext:"mysql_fetch"
site:target.com inurl:?page= intext:"include"
site:target.com inurl:?file= intext:"failed to open stream"
site:target.com inurl:?url= intext:"Warning"
```

### File Inclusion
```
site:target.com inurl:include
site:target.com inurl:require
site:target.com "include_once"
site:target.com "require_once"
```

## 🔍 Automation Scripts

### Bash Script for Multiple Dorks
```bash
#!/bin/bash
# Google Dork Automation

DOMAIN=$1
DORKS=(
    "site:$DOMAIN inurl:admin"
    "site:$DOMAIN filetype:pdf"
    "site:$DOMAIN intitle:\"index of\""
    "site:$DOMAIN \"password\""
    "site:$DOMAIN inurl:login"
)

for dork in "${DORKS[@]}"; do
    echo "Searching: $dork"
    # Add your preferred method to search
    # Example: curl or browser automation
done
```

### Python Script Example
```python
#!/usr/bin/env python3
import requests
import time

def google_dork(query):
    # Implement Google search automation
    # Note: Respect rate limits and ToS
    pass

dorks = [
    "site:target.com inurl:admin",
    "site:target.com filetype:pdf",
    "site:target.com intitle:\"index of\""
]

for dork in dorks:
    google_dork(dork)
    time.sleep(5)  # Rate limiting
```

## ⚡ Pro Tips

### 1. Combine Operators
```
site:target.com (inurl:admin OR inurl:login) filetype:php
site:target.com "password" (filetype:txt OR filetype:pdf)
```

### 2. Exclude Common Results
```
site:target.com -inurl:www
site:target.com -filetype:html
```

### 3. Time-based Searches
```
site:target.com after:2023-01-01
site:target.com before:2023-12-31
```

### 4. Wildcard Usage
```
site:*.target.com
"target * password"
```

## 🚨 Important Notes

1. **Rate Limiting**: Google may block excessive automated queries
2. **Legal Compliance**: Only use on authorized targets
3. **False Positives**: Always verify findings manually
4. **Privacy**: Respect privacy and data protection laws
5. **Documentation**: Keep records of your findings

---

**💡 Remember**: Google Dorking is just the beginning. Always verify and investigate findings further!
