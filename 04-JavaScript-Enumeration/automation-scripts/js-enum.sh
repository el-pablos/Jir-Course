#!/bin/bash

# JavaScript Enumeration Automation Script
# Untuk Jir-Course - Cybersecurity & Penetration Testing
# Original technical content by Sekiya
# Authored, summarized, and compiled by Tamas

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Banner
print_banner() {
    echo -e "${CYAN}"
    echo "  ╦╔═╗  ╔═╗┌┐┌┬ ┬┌┬┐"
    echo "  ║╚═╗  ║╣ ││││ ││││"
    echo " ╚╝╚═╝  ╚═╝┘└┘└─┘┴ ┴"
    echo -e "${NC}"
    echo -e "${YELLOW}JavaScript Enumeration Automation${NC}"
    echo -e "${BLUE}Jir-Course - Cybersecurity & Penetration Testing${NC}"
    echo "=================================================="
    echo
}

# Print functions
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_step() {
    echo -e "${PURPLE}[STEP]${NC} $1"
}

# Check dependencies
check_dependencies() {
    print_step "Checking dependencies..."
    
    local deps=("gau" "waybackurls" "katana" "httpx" "subfinder" "curl" "grep" "anew")
    local missing_deps=()
    
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            missing_deps+=("$dep")
        fi
    done
    
    if [ ${#missing_deps[@]} -ne 0 ]; then
        print_error "Missing dependencies: ${missing_deps[*]}"
        print_info "Install missing tools and try again"
        exit 1
    fi
    
    print_success "All dependencies found"
}

# Usage function
usage() {
    echo "Usage: $0 [OPTIONS] <target>"
    echo
    echo "Options:"
    echo "  -d, --deep          Deep enumeration (slower but more thorough)"
    echo "  -o, --output DIR    Output directory (default: js_enum_<target>)"
    echo "  -t, --threads NUM   Number of threads (default: 10)"
    echo "  -s, --silent        Silent mode (less output)"
    echo "  -h, --help          Show this help message"
    echo
    echo "Examples:"
    echo "  $0 target.com"
    echo "  $0 -d -o results target.com"
    echo "  $0 --threads 20 target.com"
    echo
}

# Parse arguments
parse_args() {
    DEEP_MODE=false
    OUTPUT_DIR=""
    THREADS=10
    SILENT=false
    TARGET=""
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            -d|--deep)
                DEEP_MODE=true
                shift
                ;;
            -o|--output)
                OUTPUT_DIR="$2"
                shift 2
                ;;
            -t|--threads)
                THREADS="$2"
                shift 2
                ;;
            -s|--silent)
                SILENT=true
                shift
                ;;
            -h|--help)
                usage
                exit 0
                ;;
            -*)
                print_error "Unknown option: $1"
                usage
                exit 1
                ;;
            *)
                if [ -z "$TARGET" ]; then
                    TARGET="$1"
                else
                    print_error "Multiple targets not supported"
                    exit 1
                fi
                shift
                ;;
        esac
    done
    
    if [ -z "$TARGET" ]; then
        print_error "Target is required"
        usage
        exit 1
    fi
    
    if [ -z "$OUTPUT_DIR" ]; then
        OUTPUT_DIR="js_enum_${TARGET//\//_}"
    fi
}

# Create output directory
setup_output() {
    print_step "Setting up output directory: $OUTPUT_DIR"
    
    if [ -d "$OUTPUT_DIR" ]; then
        print_warning "Output directory exists. Results will be appended."
    else
        mkdir -p "$OUTPUT_DIR"
        print_success "Created output directory"
    fi
    
    cd "$OUTPUT_DIR" || exit 1
}

# Subdomain discovery
discover_subdomains() {
    print_step "Discovering subdomains for $TARGET"
    
    if [ "$SILENT" = false ]; then
        echo "$TARGET" | subfinder | tee subdomains.txt
    else
        echo "$TARGET" | subfinder -silent > subdomains.txt
    fi
    
    local count=$(wc -l < subdomains.txt)
    print_success "Found $count subdomains"
}

# Check live subdomains
check_live_subdomains() {
    print_step "Checking live subdomains"
    
    if [ "$SILENT" = false ]; then
        cat subdomains.txt | httpx -threads "$THREADS" | tee live_subs.txt
    else
        cat subdomains.txt | httpx -threads "$THREADS" -silent > live_subs.txt
    fi
    
    local count=$(wc -l < live_subs.txt)
    print_success "Found $count live subdomains"
}

# Discover JS files
discover_js_files() {
    print_step "Discovering JavaScript files"
    
    # Initialize JS files list
    > js_files.txt
    
    # GAU
    print_info "Using GAU..."
    if [ "$DEEP_MODE" = true ]; then
        cat live_subs.txt | gau --threads "$THREADS" | grep -E "\.(js|json)$" | anew js_files.txt
    else
        cat live_subs.txt | gau --threads "$THREADS" | grep "\.js" | anew js_files.txt
    fi
    
    # Wayback URLs
    print_info "Using Wayback Machine..."
    cat live_subs.txt | waybackurls | grep "\.js" | anew js_files.txt
    
    # Katana crawler
    print_info "Using Katana crawler..."
    if [ "$DEEP_MODE" = true ]; then
        cat live_subs.txt | katana -d 3 -jc -silent -c "$THREADS" | grep "\.js" | anew js_files.txt
    else
        cat live_subs.txt | katana -jc -silent -c "$THREADS" | grep "\.js" | anew js_files.txt
    fi
    
    # Robots.txt
    print_info "Checking robots.txt files..."
    while read -r url; do
        curl -s "$url/robots.txt" | grep "\.js" | sed "s|^|$url|" | anew js_files.txt
    done < live_subs.txt
    
    local count=$(wc -l < js_files.txt)
    print_success "Found $count JavaScript files"
}

# Extract endpoints
extract_endpoints() {
    print_step "Extracting endpoints from JS files"
    
    > endpoints.txt
    
    # Check if LinkFinder is available
    if command -v linkfinder &> /dev/null; then
        print_info "Using LinkFinder..."
        cat js_files.txt | head -50 | xargs -I{} -P "$THREADS" linkfinder -i {} -o cli 2>/dev/null | anew endpoints.txt
    else
        print_warning "LinkFinder not found, using grep patterns"
        # Fallback to grep patterns
        while read -r js_file; do
            curl -s "$js_file" | grep -E "(/[a-zA-Z0-9_/.-]*|https?://[^\s\"'<>]+)" | anew endpoints.txt
        done < <(head -20 js_files.txt)
    fi
    
    local count=$(wc -l < endpoints.txt)
    print_success "Extracted $count endpoints"
}

# Extract secrets
extract_secrets() {
    print_step "Extracting secrets and API keys"
    
    > secrets.txt
    > api_keys.txt
    
    # Manual grep patterns
    print_info "Using grep patterns for secrets..."
    
    while read -r js_file; do
        if [ "$SILENT" = false ]; then
            echo "Analyzing: $js_file"
        fi
        
        # Download and analyze
        temp_file=$(mktemp)
        if curl -s "$js_file" -o "$temp_file" 2>/dev/null; then
            # API keys
            grep -E -o "(apiKey|authToken|client_secret|accessToken|api_key)[\"'= ]+[^\"' ]+" "$temp_file" | anew api_keys.txt
            
            # AWS keys
            grep -E -o "AKIA[0-9A-Z]{16}" "$temp_file" | anew secrets.txt
            
            # Google API keys
            grep -E -o "AIza[0-9A-Za-z\\-_]{35}" "$temp_file" | anew secrets.txt
            
            # JWT tokens
            grep -E -o "eyJ[A-Za-z0-9_/+-]*\.eyJ[A-Za-z0-9_/+-]*\.[A-Za-z0-9._/+-]*" "$temp_file" | anew secrets.txt
            
            # Generic secrets
            grep -E -i "(secret|password|token|key)" "$temp_file" | head -5 | anew secrets.txt
        fi
        
        rm -f "$temp_file"
    done < <(head -30 js_files.txt)
    
    local secret_count=$(wc -l < secrets.txt)
    local api_count=$(wc -l < api_keys.txt)
    print_success "Found $secret_count secrets and $api_count API keys"
}

# Extract URLs
extract_urls() {
    print_step "Extracting URLs from JS files"
    
    > extracted_urls.txt
    
    while read -r js_file; do
        curl -s "$js_file" | grep -E -o "https?://[^\s\"'<>]+" | anew extracted_urls.txt
    done < <(head -20 js_files.txt)
    
    local count=$(wc -l < extracted_urls.txt)
    print_success "Extracted $count URLs"
}

# Generate report
generate_report() {
    print_step "Generating report"
    
    cat > report.txt << EOF
JavaScript Enumeration Report
============================
Target: $TARGET
Date: $(date)
Deep Mode: $DEEP_MODE
Threads: $THREADS

Statistics:
-----------
Subdomains found: $(wc -l < subdomains.txt)
Live subdomains: $(wc -l < live_subs.txt)
JavaScript files: $(wc -l < js_files.txt)
Endpoints extracted: $(wc -l < endpoints.txt)
URLs extracted: $(wc -l < extracted_urls.txt)
Secrets found: $(wc -l < secrets.txt)
API keys found: $(wc -l < api_keys.txt)

Files Generated:
---------------
- subdomains.txt: All discovered subdomains
- live_subs.txt: Live/responsive subdomains
- js_files.txt: JavaScript files found
- endpoints.txt: Extracted endpoints
- extracted_urls.txt: URLs found in JS files
- secrets.txt: Potential secrets and tokens
- api_keys.txt: API keys and authentication tokens

Next Steps:
----------
1. Review secrets.txt and api_keys.txt for sensitive data
2. Test endpoints.txt for vulnerabilities
3. Check extracted_urls.txt for interesting targets
4. Analyze large JS files manually for business logic
5. Look for source maps (.js.map files)

EOF
    
    print_success "Report generated: report.txt"
}

# Cleanup function
cleanup() {
    print_info "Cleaning up temporary files..."
    rm -f temp_*.txt
}

# Main function
main() {
    print_banner
    
    # Parse arguments
    parse_args "$@"
    
    # Check dependencies
    check_dependencies
    
    # Setup
    setup_output
    
    # Set trap for cleanup
    trap cleanup EXIT
    
    # Start enumeration
    print_info "Starting JavaScript enumeration for: $TARGET"
    print_info "Output directory: $OUTPUT_DIR"
    print_info "Deep mode: $DEEP_MODE"
    print_info "Threads: $THREADS"
    echo
    
    # Run enumeration steps
    discover_subdomains
    check_live_subdomains
    discover_js_files
    extract_endpoints
    extract_secrets
    extract_urls
    generate_report
    
    echo
    print_success "JavaScript enumeration completed!"
    print_info "Results saved in: $OUTPUT_DIR"
    print_info "Check report.txt for summary"
    
    # Show quick stats
    echo
    echo -e "${CYAN}Quick Stats:${NC}"
    echo "JavaScript files: $(wc -l < js_files.txt)"
    echo "Endpoints: $(wc -l < endpoints.txt)"
    echo "Secrets: $(wc -l < secrets.txt)"
    echo "API keys: $(wc -l < api_keys.txt)"
}

# Run main function
main "$@"
