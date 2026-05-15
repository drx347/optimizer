# EXOTICKIC Optimizer Feature Guide

Dokumen ini menjelaskan setiap fitur di EXOTICKIC Optimizer agar pengguna yang mengambil project dari GitHub atau web share bisa memahami fungsi tiap menu sebelum menjalankannya.

## Terminal Experience

Script utama memakai beberapa elemen visual:

- `Banner` untuk header root shell.
- `Glitch-Text` untuk transisi judul profile.
- `Matrix-Rain` untuk efek terminal hijau.
- `System-Grid` untuk ringkasan target profile.
- `Fake-Scan` untuk trace log bergaya diagnostic.
- `Invoke-ProcessStages` untuk membuat proses terasa bertahap.
- `Loading-Bar` untuk progress akhir.
- `Done-Effect` untuk penutup profile.

Semua efek dibuat langsung di PowerShell tanpa dependency eksternal.

## Safe Optimize

Profile ringan untuk maintenance dasar.

Langkah:

- Membersihkan folder temp user.
- Membersihkan folder `C:\Windows\Temp`.
- Mengosongkan Recycle Bin.
- Melakukan flush DNS resolver cache.

Profile ini cocok untuk penggunaan harian karena tidak mengubah service atau network stack secara agresif.

## Super Optimize

Profile lanjutan untuk cleanup yang lebih agresif.

Langkah:

- Menjalankan base cleanup seperti Safe Optimize.
- Menonaktifkan service tertentu seperti `DiagTrack`, `SysMain`, dan `WSearch`.
- Membersihkan prefetch cache.
- Reset TCP/IP stack.
- Reset Winsock catalog.

Gunakan profile ini ketika ingin melakukan refresh lebih dalam. Beberapa perubahan network bisa membutuhkan restart agar terasa penuh.

## Cache Sweep

Profile khusus untuk membersihkan cache dasar.

Langkah:

- Membersihkan temp user.
- Membersihkan Windows temp.
- Mengosongkan Recycle Bin.

Profile ini tidak menyentuh network atau services.

## Network Boost

Profile khusus jaringan.

Langkah:

- Flush DNS resolver cache.
- Reset TCP/IP stack.
- Reset Winsock catalog.

Profile ini berguna setelah koneksi terasa bermasalah, DNS error, atau konfigurasi network terasa kacau.

## Service Tune

Profile untuk mengurangi beberapa service background.

Target default:

- `DiagTrack`
- `SysMain`
- `WSearch`

Service bisa terkunci oleh policy atau permission Windows tertentu. Jika gagal, script akan menampilkan `SKIP` tanpa error merah.

## System Scan

Profile informasi sistem.

Data yang dibaca:

- Nama OS.
- Nama CPU.
- Total memory.
- Kapasitas dan free space disk C.
- Last boot time.

Profile ini tidak mengubah konfigurasi sistem.

## Virus Scan

Profile keamanan yang menggunakan Windows Defender.

Langkah:

- Mengecek status Windows Defender lewat `Get-MpComputerStatus`.
- Menjalankan Quick Scan lewat `Start-MpScan -ScanType QuickScan`.

Jika Defender tidak tersedia, dinonaktifkan, atau diganti antivirus lain, script akan melewati langkah yang gagal dengan status `SKIP`.

## Microsoft Activation Helper

Fitur ini hanya untuk workflow resmi Microsoft.

Menu:

- Check Windows Activation Status.
- Open Windows Activation Settings.
- Activate With Official Product Key.

Tidak ada KMS bypass, crack, atau aktivasi ilegal di project ini.

## Error Handling

Semua aksi penting dibungkus memakai `Invoke-SafeAction`. Tujuannya:

- Mencegah error merah memenuhi terminal.
- Menjaga style visual tetap rapi.
- Memberi status `SKIP` jika permission atau fitur tidak tersedia.

## Admin Requirement

Beberapa fitur membutuhkan Administrator:

- Membersihkan folder Windows.
- Mengosongkan Recycle Bin.
- Reset TCP/IP.
- Reset Winsock.
- Mengubah service startup type.
- Menjalankan beberapa command aktivasi resmi.

Karena itu `run.bat` otomatis meminta akses Administrator.
