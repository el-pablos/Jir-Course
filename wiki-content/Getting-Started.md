# 🚀 Getting Started Guide

> **Original Technical Content**: Sekiya  
> **Compiled and Summarized by**: Tamas

```
┌─ ACADEMY ONBOARDING PROTOCOL ──────────────────────────────────────┐
│                                                                     │
│  🎯 MISSION: Transform from novice to elite cybersecurity operator │
│  ⚡ OBJECTIVE: Master ethical hacking and defensive security        │
│  🛡️ COMMITMENT: Maintain highest ethical standards                  │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## 🎯 **WELCOME TO THE ACADEMY**

Welcome to the Jir-Course Academy, the most comprehensive cybersecurity education platform designed to transform ordinary individuals into elite security operators. This guide will walk you through everything you need to begin your journey.

## 📋 **PRE-FLIGHT CHECKLIST**

### ✅ **Essential Prerequisites**

Before beginning your training, ensure you have:

```
┌─ KNOWLEDGE REQUIREMENTS ───────────────────────────────────────────┐
│                                                                     │
│  🐧 Linux/Unix Fundamentals                                        │
│  ├── Command line proficiency                                      │
│  ├── File system navigation                                        │
│  ├── Basic shell scripting                                         │
│  └── Package management                                             │
│                                                                     │
│  🌐 Networking Basics                                              │
│  ├── TCP/IP protocol suite                                         │
│  ├── HTTP/HTTPS protocols                                          │
│  ├── DNS and routing concepts                                      │
│  └── Firewall and NAT understanding                                │
│                                                                     │
│  💻 Programming Fundamentals                                        │
│  ├── Python (recommended)                                          │
│  ├── Bash scripting                                                │
│  ├── Basic web technologies (HTML, JS)                             │
│  └── SQL query basics                                              │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 🛠️ **Hardware Requirements**

```
┌─ MINIMUM SYSTEM SPECIFICATIONS ────────────────────────────────────┐
│                                                                     │
│  💻 Processor: Intel i5/AMD Ryzen 5 (8+ cores recommended)        │
│  🧠 Memory: 16GB RAM minimum (32GB recommended)                    │
│  💾 Storage: 500GB SSD (1TB+ recommended)                          │
│  🌐 Network: Gigabit Ethernet + WiFi capability                    │
│  🖥️ Display: 1920x1080 minimum (dual monitor recommended)          │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## 🏗️ **ENVIRONMENT SETUP**

### **Phase 1: Repository Deployment**

```bash
# 🔥 Clone the academy repository
git clone https://github.com/el-pablos/Jir-Course.git
cd Jir-Course

# 🛡️ Verify repository integrity
git log --oneline -5
git status

# 📋 Review the academy structure
ls -la
cat README.md | head -20
```

### **Phase 2: Virtual Laboratory Construction**

```bash
# 🐳 Install Docker for containerized labs
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# 📦 Install VirtualBox for VM-based labs
sudo apt update
sudo apt install virtualbox virtualbox-ext-pack

# 🔧 Install essential tools
sudo apt install -y curl wget git jq nmap netcat-openbsd
```

### **Phase 3: Security Tools Installation**

```bash
# 🛠️ Install Go-based security tools
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest

# 🐍 Install Python security libraries
pip3 install requests beautifulsoup4 colorama

# 🔧 Make scripts executable
find . -name "*.sh" -exec chmod +x {} \;
```

## 🎯 **LEARNING PATH SELECTION**

Choose your specialization based on your current skill level and career goals:

### 🔰 **BEGINNER TRACK** (3-6 months)

```
┌─ FOUNDATION CURRICULUM ────────────────────────────────────────────┐
│                                                                     │
│  Week 1-4:   🔍 06-Reconnaissance                                  │
│  Week 5-8:   🔓 07-Vulnerability-Analysis                          │
│  Week 9-12:  💥 08-Exploitation                                    │
│  Week 13-16: 🔄 02-Reverse-Shell                                   │
│  Week 17-20: 🔒 03-Persistence                                     │
│  Week 21-24: 🤖 10-Automation-Tools                                │
│                                                                     │
│  🎯 Goal: Solid foundation in ethical hacking principles           │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### ⚡ **INTERMEDIATE TRACK** (6-12 months)

```
┌─ ADVANCED TECHNIQUES CURRICULUM ───────────────────────────────────┐
│                                                                     │
│  Month 1-2:  🛡️ 01-EDR-Bypass                                      │
│  Month 3-4:  🌐 04-JavaScript-Enumeration                          │
│  Month 5-6:  🛡️ 05-Shell-Defense                                   │
│  Month 7-8:  🎪 09-Post-Exploitation                               │
│  Month 9-12: 🔬 Custom Tool Development                            │
│                                                                     │
│  🎯 Goal: Professional penetration testing capabilities            │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 💀 **EXPERT TRACK** (12+ months)

```
┌─ ELITE OPERATOR CURRICULUM ────────────────────────────────────────┐
│                                                                     │
│  Quarter 1: 🔬 0-day Research & Exploit Development               │
│  Quarter 2: 🏢 Enterprise Red Team Operations                     │
│  Quarter 3: ☁️ Cloud Security & Container Exploitation            │
│  Quarter 4: 🎓 Teaching & Community Leadership                    │
│                                                                     │
│  🎯 Goal: Industry leadership and advanced research capabilities   │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## 🧪 **FIRST LAB EXERCISE**

Let's start with a simple reconnaissance exercise to test your setup:

### **Exercise 1: Basic Information Gathering**

```bash
# 🎯 Target: Your own domain or a test domain
TARGET="example.com"

# 🔍 Step 1: Basic DNS enumeration
nslookup $TARGET
dig $TARGET ANY

# 🌐 Step 2: Subdomain discovery (if subfinder is installed)
subfinder -d $TARGET -silent

# 📊 Step 3: HTTP probing (if httpx is installed)
echo $TARGET | httpx -title -status-code

# 📋 Step 4: Document your findings
echo "Reconnaissance completed for $TARGET" > first-lab-results.txt
```

## 📚 **STUDY METHODOLOGY**

### **The OODA Loop Approach**

```
┌─ LEARNING CYCLE ───────────────────────────────────────────────────┐
│                                                                     │
│  🔍 OBSERVE                                                        │
│  ├── Read module documentation thoroughly                          │
│  ├── Watch demonstration videos                                    │
│  └── Analyze real-world examples                                   │
│                                                                     │
│  🧠 ORIENT                                                         │
│  ├── Understand the underlying principles                          │
│  ├── Connect to previous knowledge                                 │
│  └── Identify practical applications                               │
│                                                                     │
│  🎯 DECIDE                                                         │
│  ├── Choose appropriate techniques for scenarios                   │
│  ├── Plan your approach and methodology                            │
│  └── Consider ethical and legal implications                       │
│                                                                     │
│  ⚡ ACT                                                            │
│  ├── Practice in controlled lab environments                       │
│  ├── Apply techniques to authorized targets                        │
│  └── Document and share your learnings                             │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## 🤝 **COMMUNITY ENGAGEMENT**

### **Join the Academy Community**

- **💬 Discord**: [Jir-Course Academy](https://discord.gg/jircourse)
- **📱 Telegram**: [Nexarium Elite Group](https://t.me/+SfN6YXOTwCgyNDY1)
- **🐦 Twitter**: [@JirCourseAcademy](https://twitter.com/jircourse)
- **📧 Email**: academy@jir-course.com

### **Contribution Opportunities**

- **🐛 Bug Reports**: Help improve the academy by reporting issues
- **💡 Feature Suggestions**: Propose new modules or enhancements
- **📚 Content Creation**: Contribute educational materials
- **🎓 Mentorship**: Help guide newcomers in their journey

## 🚨 **SAFETY PROTOCOLS**

### **Legal and Ethical Guidelines**

```
╔══════════════════════════════════════════════════════════════════════════════╗
║  ⚖️ LEGAL COMPLIANCE FRAMEWORK                                              ║
║                                                                              ║
║  ✅ ALWAYS obtain explicit written permission before testing                ║
║  ✅ ONLY test on systems you own or have authorization to test              ║
║  ✅ FOLLOW responsible disclosure practices for vulnerabilities             ║
║  ✅ RESPECT privacy and data protection laws in your jurisdiction           ║
║  ✅ MAINTAIN detailed logs of all authorized testing activities             ║
║                                                                              ║
║  ❌ NEVER test on systems without explicit permission                       ║
║  ❌ NEVER access, modify, or delete data without authorization              ║
║  ❌ NEVER use academy knowledge for malicious or illegal purposes           ║
║  ❌ NEVER share or distribute malicious tools or exploits                   ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

## 📞 **SUPPORT & HELP**

If you encounter issues or need assistance:

1. **📖 Check the Documentation**: Most questions are answered in the wiki
2. **🔍 Search Issues**: Look for similar problems in GitHub issues
3. **💬 Ask the Community**: Engage with fellow students in Discord/Telegram
4. **🐛 Report Bugs**: Create detailed issue reports for technical problems
5. **📧 Contact Support**: Reach out to academy@jir-course.com for urgent matters

## 🎯 **NEXT STEPS**

Now that you're set up, choose your next action:

- **📚 [Explore Learning Paths](Learning-Paths)** - Choose your specialization
- **🛠️ [Setup Lab Environment](Lab-Environment-Setup)** - Build your practice lab
- **🔍 [Start with Reconnaissance](Module-Documentation#reconnaissance)** - Begin with information gathering
- **🤖 [Try Automation Tools](Tool-Reference)** - Explore our automation framework

---

**🎓 Welcome to the Academy - Your Journey to Cybersecurity Mastery Begins Now!** 🎓

*Remember: With great power comes great responsibility. Stay ethical, stay curious, stay elite.* 🔐✨
