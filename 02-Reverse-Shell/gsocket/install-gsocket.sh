#!/bin/bash

# Gsocket Installation Script
# Untuk Jir-Course - Cybersecurity & Penetration Testing
# Original technical content by Sekiya
# Authored, summarized, and compiled by Tamas

echo "🔧 Gsocket Installation Script"
echo "================================"

# Colors untuk output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function untuk print colored output
print_status() {
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

# Check if running as root
check_root() {
    if [[ $EUID -eq 0 ]]; then
        print_warning "Running as root. This is not recommended for security reasons."
        read -p "Continue anyway? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
}

# Check system compatibility
check_compatibility() {
    print_status "Checking system compatibility..."
    
    # Check OS
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        print_success "Linux detected"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        print_success "macOS detected"
    else
        print_error "Unsupported OS: $OSTYPE"
        exit 1
    fi
    
    # Check glibc version
    if command -v ldd &> /dev/null; then
        GLIBC_VERSION=$(ldd --version | head -n1 | grep -oE '[0-9]+\.[0-9]+')
        print_status "GLIBC version: $GLIBC_VERSION"
        
        # Check if version >= 2.17
        if awk "BEGIN {exit !($GLIBC_VERSION >= 2.17)}"; then
            print_success "GLIBC version compatible"
        else
            print_warning "GLIBC version might be too old. Minimum required: 2.17"
        fi
    fi
    
    # Check architecture
    ARCH=$(uname -m)
    print_status "Architecture: $ARCH"
    
    if [[ "$ARCH" == "x86_64" ]] || [[ "$ARCH" == "amd64" ]]; then
        print_success "Architecture supported"
    else
        print_warning "Architecture might not be fully supported"
    fi
}

# Install gsocket via package manager
install_via_package_manager() {
    print_status "Attempting installation via package manager..."
    
    if command -v apt &> /dev/null; then
        print_status "Using apt (Debian/Ubuntu)"
        sudo apt update
        if sudo apt install -y gsocket; then
            print_success "Gsocket installed via apt"
            return 0
        else
            print_warning "Failed to install via apt"
            return 1
        fi
    elif command -v yum &> /dev/null; then
        print_status "Using yum (RHEL/CentOS)"
        if sudo yum install -y gsocket; then
            print_success "Gsocket installed via yum"
            return 0
        else
            print_warning "Failed to install via yum"
            return 1
        fi
    elif command -v pacman &> /dev/null; then
        print_status "Using pacman (Arch Linux)"
        if sudo pacman -S --noconfirm gsocket; then
            print_success "Gsocket installed via pacman"
            return 0
        else
            print_warning "Failed to install via pacman"
            return 1
        fi
    else
        print_warning "No supported package manager found"
        return 1
    fi
}

# Install gsocket via curl script
install_via_curl() {
    print_status "Installing gsocket via curl script..."
    
    # Set environment variable to skip certificate check
    export GS_NOCERTCHECK=1
    
    # Download and execute install script
    if curl -fsSL https://gsocket.io/y | bash; then
        print_success "Gsocket installed via curl script"
        return 0
    else
        print_error "Failed to install via curl script"
        return 1
    fi
}

# Verify installation
verify_installation() {
    print_status "Verifying installation..."
    
    if command -v gs-netcat &> /dev/null; then
        print_success "gs-netcat found in PATH"
        
        # Get version info
        VERSION=$(gs-netcat -h 2>&1 | head -n1 || echo "Version info not available")
        print_status "Version: $VERSION"
        
        # Test basic functionality
        print_status "Testing basic functionality..."
        if timeout 2 gs-netcat -h &> /dev/null; then
            print_success "Basic functionality test passed"
        else
            print_warning "Basic functionality test failed"
        fi
        
        return 0
    else
        print_error "gs-netcat not found in PATH"
        
        # Check common installation paths
        COMMON_PATHS=(
            "/usr/local/bin/gs-netcat"
            "/usr/bin/gs-netcat"
            "$HOME/.local/bin/gs-netcat"
            "./gs-netcat"
        )
        
        for path in "${COMMON_PATHS[@]}"; do
            if [[ -f "$path" ]]; then
                print_status "Found gs-netcat at: $path"
                print_status "Add to PATH: export PATH=\$PATH:$(dirname $path)"
                return 0
            fi
        done
        
        return 1
    fi
}

# Generate example usage
generate_examples() {
    print_status "Generating usage examples..."
    
    cat > gsocket-examples.txt << 'EOF'
# Gsocket Usage Examples
# ======================

# Basic Server (Listener)
gs-netcat -l -s "your_secret_key"

# Basic Client (Connect)
gs-netcat -c -s "your_secret_key" -i

# Server with specific encryption
gs-netcat -l -s "your_secret_key" -C aes256

# Client with stealth mode
gs-netcat -c -s "your_secret_key" -i -q

# Background connection
nohup gs-netcat -c -s "your_secret_key" -i &

# With custom process name
exec -a "systemd-worker" gs-netcat -c -s "your_secret_key" -i

# File transfer (server side)
gs-netcat -l -s "your_secret_key" < file_to_send.txt

# File transfer (client side)
gs-netcat -c -s "your_secret_key" > received_file.txt

# Port forwarding
gs-netcat -l -s "your_secret_key" -p 8080

# Generate random secret key
SECRET=$(openssl rand -hex 16)
echo "Generated secret: $SECRET"
gs-netcat -l -s "$SECRET"

# Test connection
gs-netcat -c -s "test_key" -e "echo 'Connection successful'"
EOF
    
    print_success "Examples saved to gsocket-examples.txt"
}

# Main installation process
main() {
    echo
    print_status "Starting Gsocket installation process..."
    echo
    
    # Check if already installed
    if command -v gs-netcat &> /dev/null; then
        print_success "Gsocket is already installed!"
        verify_installation
        generate_examples
        exit 0
    fi
    
    # Run checks
    check_root
    check_compatibility
    
    echo
    print_status "Attempting installation methods..."
    
    # Try package manager first
    if install_via_package_manager; then
        verify_installation
        generate_examples
        exit 0
    fi
    
    # Try curl script as fallback
    if install_via_curl; then
        verify_installation
        generate_examples
        exit 0
    fi
    
    # If all methods fail
    print_error "All installation methods failed!"
    echo
    print_status "Manual installation options:"
    echo "1. Download binary from: https://github.com/hackerschoice/gsocket/releases"
    echo "2. Compile from source: https://github.com/hackerschoice/gsocket"
    echo "3. Use Docker: docker run --rm -it hackerschoice/gsocket"
    
    exit 1
}

# Cleanup function
cleanup() {
    print_status "Cleaning up..."
    unset GS_NOCERTCHECK
}

# Set trap for cleanup
trap cleanup EXIT

# Run main function
main "$@"
