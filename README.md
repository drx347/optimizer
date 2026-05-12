# EXOTICKIC Optimizer

Simple PowerShell-based optimizer utility with a terminal-style interface.

## Files

- `drxdvs-optimizer.ps1` : main optimizer script
- `run.bat` : launcher that requests Administrator access automatically

## Cara Pakai

### Opsi 1 - Jalankan lewat `run.bat`

1. Buka folder project.
2. Klik dua kali `run.bat`.
3. Jika muncul permintaan Administrator, pilih `Yes`.
4. Pilih menu yang tersedia:
   - `1` untuk `Safe Optimize`
   - `2` untuk `Super Optimize`
   - `3` untuk keluar

### Opsi 2 - Jalankan langsung lewat PowerShell

```powershell
powershell -ExecutionPolicy Bypass -File .\drxdvs-optimizer.ps1
```

## Penjelasan Menu

- `Safe Optimize`
  Membersihkan file sementara, recycle bin, dan flush DNS.

- `Super Optimize`
  Menjalankan semua proses di mode aman, lalu tambahan reset network dan stop beberapa service tertentu.

## Catatan

- Disarankan menjalankan script sebagai Administrator agar semua fitur berjalan maksimal.
- Gunakan dengan bijak, terutama opsi `Super Optimize`, karena ada perubahan pada service dan reset network.

## Author

- GitHub: `@drx347`
