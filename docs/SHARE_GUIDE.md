# Web Share Guide

Panduan ini dibuat untuk membagikan EXOTICKIC Optimizer lewat GitHub, website pribadi, atau file sharing.

## File Yang Wajib Ada

Minimal file yang harus dibagikan:

- `run.bat`
- `drxdvs-optimizer.ps1`

File tambahan yang disarankan:

- `README.md`
- `docs/FEATURES.md`
- `docs/TROUBLESHOOTING.md`

## Format ZIP

Struktur ZIP yang disarankan:

```text
EXOTICKIC-Optimizer/
  run.bat
  drxdvs-optimizer.ps1
  README.md
  docs/
    FEATURES.md
    SHARE_GUIDE.md
    TROUBLESHOOTING.md
```

Jangan memisahkan `run.bat` dari `drxdvs-optimizer.ps1`, karena launcher mencari script utama di folder yang sama.

## Cara User Menjalankan

Instruksi sederhana untuk user:

1. Extract ZIP.
2. Buka folder hasil extract.
3. Klik kanan atau double-click `run.bat`.
4. Pilih `Yes` saat Windows meminta Administrator.
5. Pilih menu di terminal.

## Catatan Browser

Beberapa browser atau antivirus bisa memberi warning untuk file `.bat` atau `.ps1` karena jenis file ini bisa menjalankan command. Itu normal untuk script Windows.

Untuk mengurangi kebingungan user:

- Jelaskan fitur di README.
- Sertakan source code apa adanya.
- Jangan obfuscate script.
- Jangan pack ke executable mencurigakan.

## GitHub Release

Jika ingin membagikan lewat GitHub:

1. Commit semua file.
2. Push ke repository.
3. Buat release baru.
4. Upload ZIP yang berisi struktur folder lengkap.

## Nama File

Nama file utama tetap:

- `drxdvs-optimizer.ps1`
- `run.bat`

Jangan mengganti nama script utama kecuali ikut mengubah path di launcher.

## Tips Tampilan

Project ini paling bagus dijalankan di Windows Terminal atau PowerShell console dengan warna default gelap. Warna hijau terminal akan terlihat paling rapi pada background hitam.
