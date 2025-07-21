# 🛠️ Lab Environment Setup: Elite Operator Infrastructure

> **Original Technical Content**: Sekiya - Master Infrastructure Architect  
> **Compiled and Summarized by**: Tamas - Lab Environment Specialist

```
    ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
    ██ ▄▄▄▄▄ ██ ▄▄▄▄▄ ██ ▄▄▄▄▄ ██ ▄▄▄▄▄ ██ ▄▄▄▄▄ ██ ▄▄▄▄▄ ██ ▄▄▄▄▄ ██ ▄▄▄▄▄ ██ ▄▄▄▄▄ ██
    ██ ██▄▄▄ ██ ██▄▄▄ ██ ██▄▄▄ ██ ██▄▄▄ ██ ██▄▄▄ ██ ██▄▄▄ ██ ██▄▄▄ ██ ██▄▄▄ ██ ██▄▄▄ ██
    ██ ▀▀▀▀▀ ██ ▀▀▀▀▀ ██ ▀▀▀▀▀ ██ ▀▀▀▀▀ ██ ▀▀▀▀▀ ██ ▀▀▀▀▀ ██ ▀▀▀▀▀ ██ ▀▀▀▀▀ ██ ▀▀▀▀▀ ██
    ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
    
    ██╗      █████╗ ██████╗     ███████╗███╗   ██╗██╗   ██╗██╗██████╗  ██████╗ ███╗   ██╗███╗   ███╗███████╗███╗   ██╗████████╗
    ██║     ██╔══██╗██╔══██╗    ██╔════╝████╗  ██║██║   ██║██║██╔══██╗██╔═══██╗████╗  ██║████╗ ████║██╔════╝████╗  ██║╚══██╔══╝
    ██║     ███████║██████╔╝    █████╗  ██╔██╗ ██║██║   ██║██║██████╔╝██║   ██║██╔██╗ ██║██╔████╔██║█████╗  ██╔██╗ ██║   ██║   
    ██║     ██╔══██║██╔══██╗    ██╔══╝  ██║╚██╗██║╚██╗ ██╔╝██║██╔══██╗██║   ██║██║╚██╗██║██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   
    ███████╗██║  ██║██████╔╝    ███████╗██║ ╚████║ ╚████╔╝ ██║██║  ██║╚██████╔╝██║ ╚████║██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   
    ╚══════╝╚═╝  ╚═╝╚═════╝     ╚══════╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   
```

<div align="center">

## 🏗️ **ENTERPRISE-GRADE LAB INFRASTRUCTURE** 🏗️

### 🔥 *Professional Cybersecurity Laboratory Construction* 🔥

</div>

---

## 🎯 **LAB ARCHITECTURE OVERVIEW**

```
╔═══════════════════════════════════════════════════════════════════════════════════════════╗
║                           🏗️ ELITE OPERATOR LAB ARCHITECTURE 🏗️                         ║
╠═══════════════════════════════════════════════════════════════════════════════════════════╣
║                                                                                           ║
║  🔴 TIER 1: ATTACK INFRASTRUCTURE                                                         ║
║  ├─ Kali Linux Attack Platform (Primary)                                                 ║
║  ├─ Parrot Security OS (Secondary)                                                       ║
║  ├─ Custom Attack Tools & Frameworks                                                     ║
║  └─ Command & Control Infrastructure                                                     ║
║                                                                                           ║
║  🟠 TIER 2: TARGET ENVIRONMENT                                                           ║
║  ├─ Vulnerable Web Applications (DVWA, WebGoat)                                          ║
║  ├─ Vulnerable Operating Systems (Metasploitable)                                        ║
║  ├─ Network Services & Applications                                                      ║
║  └─ Enterprise Simulation Environment                                                    ║
║                                                                                           ║
║  🟡 TIER 3: DEFENSIVE INFRASTRUCTURE                                                     ║
║  ├─ SIEM & Log Management (ELK Stack)                                                    ║
║  ├─ Network Monitoring & IDS/IPS                                                        ║
║  ├─ Incident Response Platform                                                           ║
║  └─ Forensics & Analysis Workstation                                                    ║
║                                                                                           ║
║  🟢 TIER 4: MANAGEMENT & ORCHESTRATION                                                   ║
║  ├─ Virtualization Platform (VMware/VirtualBox)                                          ║
║  ├─ Container Orchestration (Docker/Kubernetes)                                          ║
║  ├─ Infrastructure as Code (Terraform/Ansible)                                           ║
║  └─ Monitoring & Automation Dashboard                                                    ║
║                                                                                           ║
╚═══════════════════════════════════════════════════════════════════════════════════════════╝
```

## 🖥️ **HARDWARE REQUIREMENTS**

### **🎯 Minimum System Specifications**

```
┌─ HARDWARE REQUIREMENTS MATRIX ─────────────────────────────────────────────────────────┐
│                                                                                         │
│  💻 BASIC LAB SETUP (Entry Level)                                                      │
│  ├─ CPU: Intel i5-8400 / AMD Ryzen 5 2600 (6 cores)                                  │
│  ├─ RAM: 16GB DDR4 (32GB recommended)                                                  │
│  ├─ Storage: 500GB SSD + 1TB HDD                                                       │
│  ├─ Network: Gigabit Ethernet + WiFi 6                                                 │
│  └─ GPU: Integrated graphics (dedicated GPU optional)                                  │
│                                                                                         │
│  🔥 PROFESSIONAL LAB SETUP (Intermediate)                                              │
│  ├─ CPU: Intel i7-10700K / AMD Ryzen 7 3700X (8+ cores)                              │
│  ├─ RAM: 32GB DDR4 (64GB recommended)                                                  │
│  ├─ Storage: 1TB NVMe SSD + 2TB HDD                                                    │
│  ├─ Network: Dual Gigabit Ethernet + WiFi 6E                                           │
│  └─ GPU: GTX 1660 / RTX 3060 (for GPU-accelerated tasks)                              │
│                                                                                         │
│  ⚡ ENTERPRISE LAB SETUP (Advanced)                                                     │
│  ├─ CPU: Intel i9-12900K / AMD Ryzen 9 5900X (12+ cores)                             │
│  ├─ RAM: 64GB DDR4/DDR5 (128GB recommended)                                            │
│  ├─ Storage: 2TB NVMe SSD + 4TB HDD RAID                                               │
│  ├─ Network: 10Gb Ethernet + Multiple NICs                                             │
│  └─ GPU: RTX 3080 / RTX 4070 (for AI/ML workloads)                                    │
│                                                                                         │
└─────────────────────────────────────────────────────────────────────────────────────────┘
```

### **🌐 Network Infrastructure Requirements**

```bash
# Network Topology Planning
cat > network-topology.md << 'EOF'
# 🌐 Elite Operator Network Topology

## Network Segments
- **Management Network**: 192.168.1.0/24
- **Attack Network**: 192.168.10.0/24  
- **Target Network**: 192.168.20.0/24
- **Monitoring Network**: 192.168.30.0/24
- **DMZ Network**: 192.168.100.0/24

## VLAN Configuration
- VLAN 1: Management (Untagged)
- VLAN 10: Attack Infrastructure
- VLAN 20: Target Environment
- VLAN 30: Security Monitoring
- VLAN 100: DMZ Services

## Firewall Rules
- Default DENY all inter-VLAN traffic
- Allow Management -> All VLANs (monitoring)
- Allow Attack -> Target (controlled testing)
- Block Target -> Attack (prevent reverse attacks)
- Allow Monitoring -> All VLANs (logging)
EOF
```

## 🐧 **OPERATING SYSTEM SETUP**

### **🎯 Primary Attack Platform: Kali Linux**

```bash
#!/bin/bash
# Kali Linux Professional Setup Script

echo "🐧 Setting up Kali Linux for Elite Operations"

# Update system packages
sudo apt update && sudo apt full-upgrade -y

# Install additional security tools
sudo apt install -y \
    bloodhound \
    covenant-kbx \
    crackmapexec \
    empire \
    gobuster \
    impacket-scripts \
    john \
    masscan \
    nuclei \
    responder \
    sqlmap \
    subfinder \
    whatweb

# Install development tools
sudo apt install -y \
    build-essential \
    git \
    python3-pip \
    python3-venv \
    nodejs \
    npm \
    golang-go \
    docker.io \
    docker-compose

# Configure Python environment
python3 -m pip install --user --upgrade pip
python3 -m pip install --user \
    requests \
    beautifulsoup4 \
    colorama \
    pwntools \
    scapy \
    paramiko \
    cryptography

# Install Go-based tools
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install github.com/projectdiscovery/katana/cmd/katana@latest

# Configure Docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
sudo systemctl start docker

# Create workspace directories
mkdir -p ~/workspace/{tools,scripts,reports,targets}
mkdir -p ~/workspace/tools/{custom,third-party}

echo "✅ Kali Linux setup completed"
echo "🔄 Please reboot to complete the setup"
```

### **🛡️ Defensive Platform: Ubuntu Server**

```bash
#!/bin/bash
# Ubuntu Server SIEM Setup Script

echo "🛡️ Setting up Ubuntu Server for Defensive Operations"

# Update system
sudo apt update && sudo apt upgrade -y

# Install Java for Elasticsearch
sudo apt install -y openjdk-11-jdk

# Install Docker and Docker Compose
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Create ELK Stack configuration
mkdir -p ~/elk-stack
cd ~/elk-stack

cat > docker-compose.yml << 'EOF'
version: '3.8'
services:
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:8.11.0
    container_name: elasticsearch
    environment:
      - discovery.type=single-node
      - "ES_JAVA_OPTS=-Xms2g -Xmx2g"
      - xpack.security.enabled=false
    ports:
      - "9200:9200"
    volumes:
      - elasticsearch_data:/usr/share/elasticsearch/data

  logstash:
    image: docker.elastic.co/logstash/logstash:8.11.0
    container_name: logstash
    ports:
      - "5044:5044"
      - "5000:5000/tcp"
      - "5000:5000/udp"
    volumes:
      - ./logstash/config:/usr/share/logstash/pipeline
    depends_on:
      - elasticsearch

  kibana:
    image: docker.elastic.co/kibana/kibana:8.11.0
    container_name: kibana
    ports:
      - "5601:5601"
    environment:
      - ELASTICSEARCH_HOSTS=http://elasticsearch:9200
    depends_on:
      - elasticsearch

volumes:
  elasticsearch_data:
EOF

# Create Logstash configuration
mkdir -p logstash/config
cat > logstash/config/logstash.conf << 'EOF'
input {
  beats {
    port => 5044
  }
  syslog {
    port => 5000
  }
}

filter {
  if [type] == "syslog" {
    grok {
      match => { "message" => "%{SYSLOGTIMESTAMP:timestamp} %{IPORHOST:host} %{DATA:program}(?:\[%{POSINT:pid}\])?: %{GREEDYDATA:message}" }
    }
  }
}

output {
  elasticsearch {
    hosts => ["elasticsearch:9200"]
    index => "logs-%{+YYYY.MM.dd}"
  }
}
EOF

echo "✅ ELK Stack configuration created"
echo "🚀 Run 'docker-compose up -d' to start the stack"
```

## 🎪 **VULNERABLE TARGET ENVIRONMENT**

### **🎯 Automated Vulnerable Lab Deployment**

```bash
#!/bin/bash
# Vulnerable Lab Environment Setup

echo "🎪 Deploying Vulnerable Target Environment"

# Create vulnerable lab directory
mkdir -p ~/vulnerable-lab
cd ~/vulnerable-lab

# DVWA (Damn Vulnerable Web Application)
cat > dvwa-docker-compose.yml << 'EOF'
version: '3.8'
services:
  dvwa:
    image: vulnerables/web-dvwa
    container_name: dvwa
    ports:
      - "8080:80"
    environment:
      - MYSQL_HOST=dvwa-mysql
      - MYSQL_DATABASE=dvwa
      - MYSQL_USERNAME=dvwa
      - MYSQL_PASSWORD=p@ssw0rd
    depends_on:
      - dvwa-mysql

  dvwa-mysql:
    image: mysql:5.7
    container_name: dvwa-mysql
    environment:
      - MYSQL_ROOT_PASSWORD=p@ssw0rd
      - MYSQL_DATABASE=dvwa
      - MYSQL_USER=dvwa
      - MYSQL_PASSWORD=p@ssw0rd
    volumes:
      - dvwa_mysql_data:/var/lib/mysql

volumes:
  dvwa_mysql_data:
EOF

# WebGoat (OWASP WebGoat)
cat > webgoat-docker-compose.yml << 'EOF'
version: '3.8'
services:
  webgoat:
    image: webgoat/webgoat-8.0
    container_name: webgoat
    ports:
      - "8081:8080"
    environment:
      - WEBGOAT_PORT=8080
      - WEBWOLF_PORT=9090

  webwolf:
    image: webgoat/webwolf
    container_name: webwolf
    ports:
      - "9090:9090"
    command: ["--server.port=9090", "--server.address=0.0.0.0"]
EOF

# Juice Shop (OWASP Juice Shop)
cat > juiceshop-docker-compose.yml << 'EOF'
version: '3.8'
services:
  juice-shop:
    image: bkimminich/juice-shop
    container_name: juice-shop
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=unsafe
EOF

# Metasploitable 3 (Windows)
cat > metasploitable3-setup.sh << 'EOF'
#!/bin/bash
# Metasploitable 3 Setup Script

echo "🎯 Setting up Metasploitable 3"

# Clone Metasploitable 3 repository
git clone https://github.com/rapid7/metasploitable3.git
cd metasploitable3

# Install required tools
sudo apt install -y vagrant virtualbox

# Build Metasploitable 3 Windows
vagrant up --provider=virtualbox

echo "✅ Metasploitable 3 setup completed"
echo "🌐 Access via: vagrant ssh"
EOF

chmod +x metasploitable3-setup.sh

# Start vulnerable applications
echo "🚀 Starting vulnerable applications..."
docker-compose -f dvwa-docker-compose.yml up -d
docker-compose -f webgoat-docker-compose.yml up -d
docker-compose -f juiceshop-docker-compose.yml up -d

echo "✅ Vulnerable lab environment deployed"
echo "🌐 Access points:"
echo "   - DVWA: http://localhost:8080"
echo "   - WebGoat: http://localhost:8081"
echo "   - Juice Shop: http://localhost:3000"
```

## 🔧 **AUTOMATION & ORCHESTRATION**

### **🤖 Infrastructure as Code with Terraform**

```hcl
# terraform/main.tf
# Elite Operator Lab Infrastructure

terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

# Kali Linux Attack Platform
resource "virtualbox_vm" "kali_attack" {
  count     = 1
  name      = "kali-attack-${count.index + 1}"
  image     = "https://cdimage.kali.org/kali-2023.4/kali-linux-2023.4-virtualbox-amd64.ova"
  cpus      = 4
  memory    = "8192 mib"
  
  network_adapter {
    type           = "hostonly"
    host_interface = "VirtualBox Host-Only Ethernet Adapter"
  }
  
  network_adapter {
    type = "nat"
  }
}

# Ubuntu SIEM Platform
resource "virtualbox_vm" "ubuntu_siem" {
  count     = 1
  name      = "ubuntu-siem-${count.index + 1}"
  image     = "https://releases.ubuntu.com/22.04/ubuntu-22.04.3-live-server-amd64.iso"
  cpus      = 4
  memory    = "16384 mib"
  
  network_adapter {
    type           = "hostonly"
    host_interface = "VirtualBox Host-Only Ethernet Adapter"
  }
}

# Windows Target Environment
resource "virtualbox_vm" "windows_target" {
  count     = 1
  name      = "windows-target-${count.index + 1}"
  image     = "windows-server-2019.iso"
  cpus      = 2
  memory    = "4096 mib"
  
  network_adapter {
    type           = "hostonly"
    host_interface = "VirtualBox Host-Only Ethernet Adapter"
  }
}

output "lab_infrastructure" {
  value = {
    kali_vms = virtualbox_vm.kali_attack[*].name
    siem_vms = virtualbox_vm.ubuntu_siem[*].name
    target_vms = virtualbox_vm.windows_target[*].name
  }
}
```

### **🎯 Ansible Automation Playbooks**

```yaml
# ansible/site.yml
# Elite Operator Lab Automation

---
- name: Configure Kali Linux Attack Platform
  hosts: kali_hosts
  become: yes
  vars:
    tools_directory: /opt/elite-tools
    
  tasks:
    - name: Update package cache
      apt:
        update_cache: yes
        cache_valid_time: 3600
    
    - name: Install essential security tools
      apt:
        name:
          - nmap
          - masscan
          - gobuster
          - sqlmap
          - john
          - hashcat
          - metasploit-framework
        state: present
    
    - name: Create tools directory
      file:
        path: "{{ tools_directory }}"
        state: directory
        mode: '0755'
    
    - name: Clone custom tools repository
      git:
        repo: https://github.com/el-pablos/Jir-Course.git
        dest: "{{ tools_directory }}/jir-course"
        version: master
    
    - name: Make scripts executable
      shell: find {{ tools_directory }}/jir-course -name "*.sh" -exec chmod +x {} \;

- name: Configure Ubuntu SIEM Platform
  hosts: siem_hosts
  become: yes
  
  tasks:
    - name: Install Docker
      shell: |
        curl -fsSL https://get.docker.com -o get-docker.sh
        sh get-docker.sh
        usermod -aG docker ubuntu
    
    - name: Install Docker Compose
      get_url:
        url: "https://github.com/docker/compose/releases/latest/download/docker-compose-Linux-x86_64"
        dest: /usr/local/bin/docker-compose
        mode: '0755'
    
    - name: Deploy ELK Stack
      copy:
        src: ../elk-stack/
        dest: /opt/elk-stack/
        mode: '0644'
    
    - name: Start ELK Stack
      shell: |
        cd /opt/elk-stack
        docker-compose up -d

- name: Configure Target Environment
  hosts: target_hosts
  become: yes
  
  tasks:
    - name: Install vulnerable services
      apt:
        name:
          - apache2
          - mysql-server
          - php
          - php-mysql
          - vsftpd
          - telnetd
        state: present
    
    - name: Configure intentionally weak settings
      lineinfile:
        path: /etc/ssh/sshd_config
        regexp: '^PermitRootLogin'
        line: 'PermitRootLogin yes'
      notify: restart ssh
  
  handlers:
    - name: restart ssh
      service:
        name: ssh
        state: restarted
```

## 📊 **MONITORING & ANALYTICS**

### **🎯 Lab Performance Dashboard**

```python
#!/usr/bin/env python3
"""
Elite Operator Lab Monitoring Dashboard
Real-time lab infrastructure monitoring
"""

import psutil
import docker
import json
import time
from datetime import datetime
from flask import Flask, render_template, jsonify

app = Flask(__name__)
client = docker.from_env()

class LabMonitor:
    def __init__(self):
        self.start_time = datetime.now()
    
    def get_system_metrics(self):
        """Get system performance metrics"""
        return {
            'cpu_percent': psutil.cpu_percent(interval=1),
            'memory': {
                'total': psutil.virtual_memory().total,
                'available': psutil.virtual_memory().available,
                'percent': psutil.virtual_memory().percent
            },
            'disk': {
                'total': psutil.disk_usage('/').total,
                'used': psutil.disk_usage('/').used,
                'percent': psutil.disk_usage('/').percent
            },
            'network': {
                'bytes_sent': psutil.net_io_counters().bytes_sent,
                'bytes_recv': psutil.net_io_counters().bytes_recv
            }
        }
    
    def get_container_status(self):
        """Get Docker container status"""
        containers = []
        for container in client.containers.list(all=True):
            containers.append({
                'name': container.name,
                'status': container.status,
                'image': container.image.tags[0] if container.image.tags else 'unknown',
                'ports': container.ports,
                'created': container.attrs['Created']
            })
        return containers
    
    def get_lab_services(self):
        """Get lab service status"""
        services = {
            'dvwa': self.check_service('http://localhost:8080'),
            'webgoat': self.check_service('http://localhost:8081'),
            'juice_shop': self.check_service('http://localhost:3000'),
            'kibana': self.check_service('http://localhost:5601'),
            'elasticsearch': self.check_service('http://localhost:9200')
        }
        return services
    
    def check_service(self, url):
        """Check if service is responding"""
        try:
            import requests
            response = requests.get(url, timeout=5)
            return response.status_code == 200
        except:
            return False

monitor = LabMonitor()

@app.route('/')
def dashboard():
    return render_template('dashboard.html')

@app.route('/api/metrics')
def api_metrics():
    return jsonify({
        'system': monitor.get_system_metrics(),
        'containers': monitor.get_container_status(),
        'services': monitor.get_lab_services(),
        'uptime': str(datetime.now() - monitor.start_time)
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
```

---

<div align="center">

```
    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
    ▓                                                                                ▓
    ▓  ⚡ "A well-prepared laboratory is the foundation of elite operations" ⚡      ▓
    ▓                                                                                ▓
    ▓       🔥 BUILD SYSTEMATICALLY • TEST THOROUGHLY • OPERATE PROFESSIONALLY 🔥   ▓
    ▓                                                                                ▓
    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
```

### 🛠️ **LAB INFRASTRUCTURE MASTERED - ELITE ENVIRONMENT ACHIEVED** 🛠️

*Your laboratory is now a fortress of knowledge, equipped with the finest tools and defenses for elite cybersecurity operations.* 🔐⚡

</div>
