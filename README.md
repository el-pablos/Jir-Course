# 🔥 Jir-Course: Comprehensive Cybersecurity & Penetration Testing Course

![Course Banner](https://img.shields.io/badge/Course-Cybersecurity%20%26%20Penetration%20Testing-red?style=for-the-badge)
![License](https://img.shields.io/badge/License-Educational%20Use-green?style=for-the-badge)
![Language](https://img.shields.io/badge/Language-Bahasa%20Indonesia-blue?style=for-the-badge)

## 📋 Deskripsi Course

Repository ini berisi materi pembelajaran lengkap untuk cybersecurity dan penetration testing, mulai dari teknik bypass EDR hingga post-exploitation. Course ini dirancang untuk memberikan pemahaman mendalam tentang teknik-teknik hacking yang digunakan dalam dunia nyata.

## ⚠️ Disclaimer

**PENTING**: Materi dalam repository ini hanya untuk tujuan edukasi dan penelitian keamanan. Penggunaan teknik-teknik ini untuk tujuan ilegal adalah tanggung jawab pengguna sepenuhnya. Penulis tidak bertanggung jawab atas penyalahgunaan informasi ini.

## 🎯 Target Pembelajaran

Setelah menyelesaikan course ini, Anda akan mampu:
- Memahami teknik bypass EDR dan antivirus
- Menguasai berbagai metode reverse shell
- Melakukan reconnaissance dan vulnerability assessment
- Mengimplementasikan teknik persistence
- Melakukan post-exploitation dengan aman
- Menggunakan automation tools untuk efisiensi

## 📚 Struktur Course

### 🛡️ [01-EDR-Bypass](./01-EDR-Bypass/)
Teknik untuk melewati deteksi EDR (Endpoint Detection and Response)
- **Binary Obfuscation**: Teknik mengaburkan binary agar tidak terdeteksi
- **Process Injection**: Injeksi ke proses yang dipercaya
- **Network Evasion**: Menghindari deteksi network monitoring
- **Examples**: Contoh implementasi nyata

### 🔄 [02-Reverse-Shell](./02-Reverse-Shell/)
Berbagai metode untuk mendapatkan akses balik ke target
- **Gsocket**: Setup dan penggunaan Global Socket
- **Ngrok Setup**: Konfigurasi Ngrok untuk tunneling
- **FRP Setup**: Fast Reverse Proxy configuration
- **Payloads**: Koleksi payload reverse shell

### 🔒 [03-Persistence](./03-Persistence/)
Teknik mempertahankan akses pada sistem target
- **Cron Jobs**: Persistence menggunakan scheduled tasks
- **SSH Keys**: Penanaman SSH keys untuk akses berkelanjutan
- **User Creation**: Membuat user backdoor
- **Log Cleaning**: Menghapus jejak aktivitas

### 🌐 [04-JavaScript-Enumeration](./04-JavaScript-Enumeration/)
Enumerasi dan analisis JavaScript untuk bug bounty
- **Tools**: Tools untuk analisis JS files
- **Automation Scripts**: Script otomatis untuk enumerasi
- **Examples**: Contoh temuan dari JS enumeration

### 🛡️ [05-Shell-Defense](./05-Shell-Defense/)
Teknik menyembunyikan dan mempertahankan web shell
- **Hiding Techniques**: Cara menyembunyikan shell dari deteksi
- **Obfuscation**: Teknik obfuscation untuk shell
- **Backdoor Methods**: Berbagai metode backdoor

### 🔍 [06-Reconnaissance](./06-Reconnaissance/)
Tahap pengumpulan informasi target
- **Subdomain Enumeration**: Mencari subdomain target
- **Port Scanning**: Scanning port dan service
- **Google Dorking**: Teknik pencarian dengan Google

### 🔓 [07-Vulnerability-Analysis](./07-Vulnerability-Analysis/)
Analisis dan identifikasi kerentanan
- **SQL Injection**: Teknik dan bypass SQL injection
- **XSS**: Cross-Site Scripting techniques
- **File Upload**: Bypass file upload restrictions
- **WAF Bypass**: Teknik melewati Web Application Firewall

### ⚡ [08-Exploitation](./08-Exploitation/)
Eksploitasi kerentanan yang ditemukan
- **Web Shells**: Berbagai jenis web shell
- **Payload Obfuscation**: Mengaburkan payload
- **Exploit Techniques**: Teknik eksploitasi lanjutan

### 🎯 [09-Post-Exploitation](./09-Post-Exploitation/)
Aktivitas setelah mendapatkan akses awal
- **Pivoting**: Teknik lateral movement
- **SSH Tunneling**: Tunneling untuk akses internal
- **Privilege Escalation**: Eskalasi privilege

### 🤖 [10-Automation-Tools](./10-Automation-Tools/)
Tools dan script untuk otomasi
- **Installation Guides**: Panduan instalasi tools
- **Tool Configs**: Konfigurasi tools
- **Custom Scripts**: Script custom untuk otomasi

### 📖 [Resources](./Resources/)
Sumber daya tambahan
- **Cheat Sheets**: Ringkasan perintah penting
- **Wordlists**: Daftar kata untuk bruteforce
- **References**: Referensi dan dokumentasi

## 🚀 Cara Memulai

1. **Clone Repository**
   ```bash
   git clone https://github.com/el-pablos/Jir-Course.git
   cd Jir-Course
   ```

2. **Mulai dari Dasar**
   - Baca setiap README.md di setiap direktori
   - Ikuti urutan dari 01 hingga 10
   - Praktikkan di lab environment

3. **Setup Lab Environment**
   - Gunakan VM atau container untuk testing
   - Jangan test di sistem production
   - Setup target practice seperti DVWA, WebGoat

## 📋 Prerequisites

- Pengetahuan dasar Linux/Unix
- Pemahaman dasar networking
- Familiar dengan command line
- VM atau lab environment untuk testing

## 🛠️ Tools yang Digunakan

- **Reconnaissance**: subfinder, httpx, nmap, whatweb
- **Exploitation**: sqlmap, burpsuite, nuclei
- **Reverse Shell**: gsocket, ngrok, netcat
- **Automation**: custom scripts, bash, python

## 📞 Support & Community

- **Telegram Group**: [Nexarium Group](https://t.me/+SfN6YXOTwCgyNDY1)
- **Discussion**: [GitHub Issues](https://github.com/el-pablos/Jir-Course/issues)

## 📝 Contributing

Kontribusi sangat diterima! Silakan:
1. Fork repository ini
2. Buat branch untuk fitur baru
3. Commit perubahan Anda
4. Push ke branch
5. Buat Pull Request

## 📄 License

Repository ini dibuat untuk tujuan edukasi. Gunakan dengan bijak dan bertanggung jawab.

## 🙏 Credits

Materi ini dikompilasi dari berbagai sumber dan pengalaman praktis dalam bidang cybersecurity. Terima kasih kepada komunitas security yang telah berbagi pengetahuan.

---

**⚡ "Knowledge is power, but with great power comes great responsibility" ⚡**

*Happy Learning & Stay Ethical!* 🔐
