# Troubleshooting

Dokumen ini berisi solusi masalah umum saat menjalankan EXOTICKIC Optimizer.

## run.bat Tidak Membuka Script

Pastikan:

- `run.bat` dan `drxdvs-optimizer.ps1` berada di folder yang sama.
- Nama file `drxdvs-optimizer.ps1` tidak diubah.
- Folder tidak berada di lokasi yang diblokir policy kantor/sekolah.

## PowerShell Diblokir Execution Policy

Launcher sudah memakai:

```bat
powershell.exe -NoProfile -ExecutionPolicy Bypass -NoExit -File "%SCRIPT_FILE%"
```

Jika masih diblokir, kemungkinan ada policy dari organisasi atau antivirus.

## Muncul Permission Prompt

Itu normal. Banyak fitur membutuhkan Administrator, seperti:

- Membersihkan folder Windows.
- Reset network.
- Mengubah service.
- Aktivasi resmi Windows.
- Defender scan di beberapa konfigurasi.

Pilih `Yes` agar fitur bekerja maksimal.

## Ada Status SKIP

Status `SKIP` berarti langkah tersebut gagal atau terkunci, tetapi error merah sudah ditahan agar tampilan tetap rapi.

Penyebab umum:

- Tidak berjalan sebagai Administrator.
- File sedang digunakan aplikasi lain.
- Service tidak ada di versi Windows tersebut.
- Antivirus atau policy memblokir command.
- Windows Defender tidak tersedia.

## Network Boost Butuh Restart

Reset TCP/IP dan Winsock kadang baru terasa setelah restart. Jika internet masih bermasalah setelah menjalankan Network Boost, restart Windows.

## Virus Scan Tidak Jalan

Kemungkinan:

- Windows Defender dimatikan.
- Antivirus pihak ketiga menggantikan Defender.
- PowerShell Defender module tidak tersedia.
- Akses Administrator tidak cukup karena policy.

Script akan menampilkan `SKIP` jika command Defender tidak bisa dipakai.

## Activation Helper Tidak Mengaktifkan Windows

Fitur ini hanya memakai jalur resmi Microsoft.

Pastikan:

- Product key resmi.
- Format key benar: `XXXXX-XXXXX-XXXXX-XXXXX-XXXXX`.
- Internet aktif.
- Edisi Windows cocok dengan product key.
- Server aktivasi Microsoft bisa diakses.

Project ini tidak menyediakan bypass, crack, atau KMS ilegal.

## Tampilan Kurang Rapi

Coba jalankan di:

- Windows Terminal.
- PowerShell console.
- CMD yang membuka `run.bat`.

Gunakan ukuran window minimal sekitar 80 kolom agar panel terminal tidak terlalu sempit.

## File Dianggap Berbahaya Oleh Browser

File `.bat` dan `.ps1` bisa diberi warning karena bisa menjalankan command. Untuk transparansi, bagikan source code lengkap dan jangan ubah script menjadi executable tertutup.
