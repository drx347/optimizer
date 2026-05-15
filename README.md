# EXOTICKIC Optimizer

EXOTICKIC Optimizer adalah utility PowerShell berbasis terminal untuk membantu maintenance Windows dengan tampilan hijau bergaya root console. Project ini bisa dijalankan cukup lewat `run.bat`, sehingga cocok dibagikan dalam bentuk ZIP atau web share.

## Fitur Utama

- Terminal-style interface dengan efek glitch, trace log, matrix rain, stage progress, dan loading bar.
- Launcher `run.bat` yang otomatis meminta akses Administrator.
- Safe Optimize untuk membersihkan temp, recycle bin, dan DNS cache.
- Super Optimize untuk cleanup lanjutan, reset network, dan tuning service tertentu.
- Cache Sweep untuk fokus pada file sementara dan recycle bin.
- Network Boost untuk flush DNS, reset TCP/IP, dan reset Winsock.
- Service Tune untuk menonaktifkan beberapa background service yang sering berat.
- System Scan untuk melihat informasi OS, CPU, RAM, disk, dan boot time.
- Virus Scan memakai Windows Defender Quick Scan jika tersedia.
- Microsoft Activation Helper legal: cek status aktivasi, buka Activation Settings, dan aktivasi memakai product key resmi.
- Error permission ditampilkan sebagai status `SKIP` hijau, bukan error merah yang mengganggu tampilan.

## File Project

- `drxdvs-optimizer.ps1`  
  Script utama yang berisi menu, efek terminal, dan semua profile optimizer.

- `run.bat`  
  Launcher untuk double-click. File ini akan masuk ke folder script, meminta Administrator, dan menjalankan PowerShell dengan `ExecutionPolicy Bypass`.

- `docs/FEATURES.md`  
  Penjelasan fitur dan detail setiap profile.

- `docs/SHARE_GUIDE.md`  
  Panduan membagikan project lewat ZIP atau web share.

- `docs/TROUBLESHOOTING.md`  
  Solusi untuk masalah umum saat script dijalankan.

## Cara Pakai Cepat

1. Download atau extract project.
2. Pastikan `run.bat` dan `drxdvs-optimizer.ps1` berada dalam folder yang sama.
3. Klik dua kali `run.bat`.
4. Jika Windows meminta Administrator, pilih `Yes`.
5. Pilih menu yang tersedia di terminal.

## Menjalankan Manual

Jika ingin menjalankan langsung lewat PowerShell:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\drxdvs-optimizer.ps1
```

Tetap disarankan menjalankan sebagai Administrator agar semua fitur bisa bekerja maksimal.

## Struktur Menu

Menu utama:

- `Optimizer Profiles`
- `Quick System Scan`
- `Virus Scan`
- `Microsoft Activation Helper`
- `Exit`

Menu optimizer:

- `Safe Optimize`
- `Super Optimize`
- `Cache Sweep`
- `Network Boost`
- `Service Tune`
- `System Scan`
- `Virus Scan`
- `Activation Helper`
- `Back`

## Catatan Legal

Fitur Microsoft Activation Helper hanya mendukung aktivasi resmi. Project ini tidak menyediakan bypass, crack, atau aktivator KMS ilegal. Gunakan product key resmi milik pengguna.

## Catatan Keamanan

Beberapa fitur seperti reset network, stop service, atau Defender scan bisa membutuhkan akses Administrator. Jika akses tidak tersedia, script akan melewati langkah tersebut dan menampilkan status `SKIP`.

## Author

- GitHub: `@drx347`
