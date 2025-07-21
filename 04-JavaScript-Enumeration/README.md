# 🌐 JavaScript Enumeration for Bug Bounty Hunters

> **Original Technical Content**: Sekiya
> **Compiled and Summarized by**: Tamas

## 📋 Overview

JavaScript files sering mengandung informasi berharga seperti API keys, hidden endpoints, internal routes, dan secrets lainnya. Modul ini membahas teknik enumerasi JavaScript yang efektif untuk bug bounty hunting.

## ⚠️ Disclaimer

Teknik ini hanya untuk bug bounty hunting yang legal dan tujuan edukasi. Pastikan Anda memiliki izin untuk melakukan testing pada target.

## 🎯 Mengapa JavaScript Enumeration Penting?

- 🔍 **API Keys & Secrets**: Sering hardcoded dalam JS files
- 🌐 **Hidden Endpoints**: Internal API routes yang tidak terdokumentasi
- 🔗 **Internal URLs**: Links ke admin panels atau development environments
- 📊 **Business Logic**: Understanding aplikasi flow
- 🔐 **Authentication Tokens**: JWT secrets, OAuth configs

## 🔧 Automated JS File Finding

### 1. Using GAU (Get All URLs)
```bash
# Basic usage
gau target.com | grep ".js" | tee js_files.txt

# With specific extensions
gau target.com | grep -E "\.(js|json)$" | tee js_files.txt

# Multiple targets
cat domains.txt | gau | grep ".js" | anew js_files.txt
```

### 2. Wayback Machine URLs
```bash
# Using waybackurls
waybackurls target.com | grep ".js" | tee js_wayback.txt

# Combine with other sources
echo target.com | waybackurls | grep ".js" | anew all_js.txt
```

### 3. Katana Fast Crawler
```bash
# Basic crawling
katana -u https://target.com -jc -silent | tee js_katana.txt

# With custom depth
katana -u https://target.com -d 3 -jc -silent | grep ".js" | tee js_deep.txt

# Multiple URLs
cat urls.txt | katana -jc -silent | grep ".js" | anew js_files.txt
```

### 4. Combining Multiple Sources
```bash
# Comprehensive JS discovery
echo target.com | subfinder | httpx -silent | gau | grep ".js" | anew all_js.txt

# Add wayback data
echo target.com | waybackurls | grep ".js" | anew all_js.txt

# Add crawling results
katana -u https://target.com -jc -silent | grep ".js" | anew all_js.txt
```

### 5. Extract from robots.txt
```bash
# Check robots.txt for JS files
curl -s https://target.com/robots.txt | grep ".js" | awk '{print $NF}' | tee js_robots.txt

# Convert relative to absolute URLs
curl -s https://target.com/robots.txt | grep ".js" | sed 's|^|https://target.com|' | tee js_robots_full.txt
```

## 🔎 Manual Discovery Methods

### 1. Browser Developer Tools
```javascript
// Extract all script sources
Array.from(document.scripts).map(s => s.src).filter(s => s)

// Find inline scripts
Array.from(document.scripts).filter(s => !s.src).map(s => s.innerHTML)

// Network tab filtering
// F12 → Network → Filter by JS → Reload page
```

### 2. View Page Source
- **Ctrl + U**: View page source
- Search for: `<script src=`, `.js"`, `javascript:`
- Look for: webpack bundles, vendor files, app.js

### 3. Burp Suite Spider
```
1. Configure Burp proxy
2. Browse target application
3. Spider → Right-click target → Spider this host
4. Filter results by .js extension
```

## 📤 Extract Endpoints & API Keys

### 1. LinkFinder
```bash
# Basic usage
python3 linkfinder.py -i https://target.com/app.js -o cli

# Batch processing
cat js_files.txt | xargs -I{} python3 linkfinder.py -i {} -o cli | tee endpoints.txt

# With domain filtering
python3 linkfinder.py -i https://target.com/app.js -d target.com -o cli
```

### 2. SecretFinder
```bash
# Find secrets in JS files
python3 SecretFinder.py -i https://target.com/app.js -o cli | tee secrets.txt

# Batch processing
cat js_files.txt | xargs -I{} python3 SecretFinder.py -i {} -o cli | tee all_secrets.txt

# Save to file
python3 SecretFinder.py -i https://target.com/app.js -o output.html
```

### 3. GF Patterns
```bash
# API keys
cat js_files.txt | gf apikeys | tee api_keys.txt

# AWS keys
cat js_files.txt | gf aws-keys | tee aws_keys.txt

# JSON data
cat js_files.txt | gf json | tee json_leaks.txt

# URLs
cat js_files.txt | gf urls | tee urls.txt

# Subdomains
cat js_files.txt | gf subdomains | tee subdomains.txt
```

### 4. Manual Grep Patterns
```bash
# API keys and tokens
grep -E -o "(apiKey|authToken|client_secret|accessToken)[\"'= ]+[^\"' ]+" js_files.txt | tee found_keys.txt

# AWS credentials
grep -E -o "AKIA[0-9A-Z]{16}" js_files.txt

# Google API keys
grep -E -o "AIza[0-9A-Za-z\\-_]{35}" js_files.txt

# JWT tokens
grep -E -o "eyJ[A-Za-z0-9_/+-]*\.eyJ[A-Za-z0-9_/+-]*\.[A-Za-z0-9._/+-]*" js_files.txt

# URLs and endpoints
grep -E -o "https?://[^\s\"'<>]+" js_files.txt | tee extracted_urls.txt

# Internal paths
grep -E -o "/[a-zA-Z0-9_/.-]*" js_files.txt | grep -v "^/$" | tee internal_paths.txt
```

## 🔁 Chaining Tools Together

### 1. Complete JS Discovery Pipeline
```bash
#!/bin/bash
TARGET="target.com"

echo "[+] Starting JS enumeration for $TARGET"

# Create output directory
mkdir -p js_enum_$TARGET
cd js_enum_$TARGET

# 1. Subdomain discovery
echo "[+] Finding subdomains..."
echo $TARGET | subfinder -silent | tee subdomains.txt

# 2. Live subdomain check
echo "[+] Checking live subdomains..."
cat subdomains.txt | httpx -silent | tee live_subs.txt

# 3. JS file discovery
echo "[+] Finding JS files..."
cat live_subs.txt | gau | grep ".js" | anew js_files.txt
cat live_subs.txt | waybackurls | grep ".js" | anew js_files.txt
cat live_subs.txt | katana -jc -silent | grep ".js" | anew js_files.txt

# 4. Extract endpoints
echo "[+] Extracting endpoints..."
cat js_files.txt | xargs -I{} python3 ~/tools/LinkFinder/linkfinder.py -i {} -o cli | anew endpoints.txt

# 5. Extract secrets
echo "[+] Extracting secrets..."
cat js_files.txt | xargs -I{} python3 ~/tools/SecretFinder/SecretFinder.py -i {} -o cli | anew secrets.txt

# 6. GF patterns
echo "[+] Running GF patterns..."
cat js_files.txt | gf apikeys | anew api_keys.txt
cat js_files.txt | gf aws-keys | anew aws_keys.txt
cat js_files.txt | gf urls | anew extracted_urls.txt

echo "[+] JS enumeration completed!"
echo "[+] Results saved in js_enum_$TARGET/"
```

### 2. Advanced Analysis Script
```bash
#!/bin/bash
# Advanced JS analysis

analyze_js_file() {
    local file=$1
    echo "[+] Analyzing: $file"
    
    # Download JS file
    curl -s "$file" -o temp_js.js
    
    # Check file size
    size=$(wc -c < temp_js.js)
    echo "  Size: $size bytes"
    
    # Look for interesting patterns
    echo "  API Keys found:"
    grep -E "(api[_-]?key|apikey)" temp_js.js | head -3
    
    echo "  URLs found:"
    grep -E "https?://[^\s\"'<>]+" temp_js.js | head -5
    
    echo "  Potential secrets:"
    grep -E "(secret|token|password|key)" temp_js.js | head -3
    
    rm temp_js.js
    echo "---"
}

# Process each JS file
while read -r js_file; do
    analyze_js_file "$js_file"
done < js_files.txt
```

## 📁 Struktur Direktori

- **[tools/](./tools/)**: Collection of JS enumeration tools
- **[automation-scripts/](./automation-scripts/)**: Automated enumeration scripts
- **[examples/](./examples/)**: Real-world examples dan case studies

## 🛠️ Essential Tools

### Installation Commands:
```bash
# GAU
go install github.com/lc/gau/v2/cmd/gau@latest

# Waybackurls
go install github.com/tomnomnom/waybackurls@latest

# Katana
go install github.com/projectdiscovery/katana/cmd/katana@latest

# GF
go install github.com/tomnomnom/gf@latest
git clone https://github.com/1ndianl33t/Gf-Patterns
cp Gf-Patterns/*.json ~/.gf/

# LinkFinder
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder && pip3 install -r requirements.txt

# SecretFinder
git clone https://github.com/m4ll0k/SecretFinder.git
cd SecretFinder && pip3 install -r requirements.txt

# HTTPx
go install github.com/projectdiscovery/httpx/cmd/httpx@latest

# Subfinder
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
```

## 🎯 Target Specific Patterns

### React Applications:
```bash
# Look for React bundles
grep -r "react" js_files.txt
grep -r "webpack" js_files.txt

# Common React patterns
grep -E "(componentDidMount|useState|useEffect)" temp_js.js
```

### Angular Applications:
```bash
# Angular specific patterns
grep -r "angular" js_files.txt
grep -E "(ngOnInit|Injectable|Component)" temp_js.js
```

### Vue.js Applications:
```bash
# Vue.js patterns
grep -r "vue" js_files.txt
grep -E "(mounted|created|data\(\))" temp_js.js
```

## ⚡ Pro Tips

### 1. Prioritize High-Value Files:
- `app.js`, `main.js`, `bundle.js`
- `config.js`, `settings.js`
- `admin.js`, `dashboard.js`
- Webpack bundles dengan hash names

### 2. Look for Development Artifacts:
```bash
# Development/staging URLs
grep -E "(dev|test|stage|staging|beta)" js_files.txt

# Debug information
grep -E "(console\.log|debugger|TODO|FIXME)" temp_js.js

# Source maps
find . -name "*.js.map"
```

### 3. API Endpoint Discovery:
```bash
# Common API patterns
grep -E "(/api/|/v[0-9]+/|/rest/)" temp_js.js

# GraphQL endpoints
grep -E "(graphql|/gql)" temp_js.js

# WebSocket endpoints
grep -E "(ws://|wss://)" temp_js.js
```

### 4. Automation Tips:
- Use `anew` untuk deduplicate results
- Set up monitoring untuk new JS files
- Create custom wordlists dari findings
- Integrate dengan notification systems

---

**Next**: [05-Shell-Defense](../05-Shell-Defense/) - Teknik menyembunyikan dan mempertahankan shell
