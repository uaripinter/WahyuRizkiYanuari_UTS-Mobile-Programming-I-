# Daun Rumah

Aplikasi mobile panduan perawatan tanaman hias, dibuat dengan Flutter untuk Ujian Tengah Semester (UTS) Mobile Programming, Semester Ganjil 2025/2026.

**Nama:** [ISI NAMA] | **NIM:** [ISI NIM] | **Kelas:** [ISI KELAS]

## Tema dan Tujuan

**Tema:** perawatan tanaman hias di rumah.

**Tujuan:** membantu pengguna, terutama pemula, mengenali berbagai tanaman hias dan mengetahui cara merawatnya. Aplikasi ini bersifat informasi saja. Pengguna dapat melihat tanaman berdasarkan kategori (Indoor, Sukulen, Herbal) beserta kebutuhan cahaya, frekuensi penyiraman, tingkat kesulitan, dan tips perawatan.

Data yang dipakai saat ini adalah data dummy berformat JSON dan disiapkan agar mudah diganti dengan data dari API pada tahap berikutnya.

## Daftar Halaman dan Fungsinya

| Halaman | File | Fungsi |
|---|---|---|
| Beranda | `lib/screens/home_page.dart` | Menampilkan sambutan, tiga kartu kategori, dan rekomendasi tanaman untuk pemula |
| Daftar | `lib/screens/list_page.dart` | Menampilkan daftar tanaman pada kategori yang dipilih |
| Detail | `lib/screens/detail_page.dart` | Menampilkan deskripsi, kebutuhan cahaya, penyiraman, tingkat kesulitan, dan tips perawatan |

**Alur navigasi:** Beranda, lalu pilih kategori ke Daftar, lalu pilih tanaman ke Detail. Detail juga bisa dibuka langsung dari daftar rekomendasi di Beranda. Navigasi memakai `Navigator.push`.

## Struktur Proyek

```
lib/
  main.dart                   
  models/plant.dart           
  data/plant_repository.dart   
  screens/                    
assets/data/plants.json        
```

## Palet Warna

Forest `#1F3D3A`, Sage `#8FA998`, Rose `#D9A5A0`, Mustard `#E0B04F`, Clay `#B5654A`, Ivory `#F5F0E6`.

## Cara Menjalankan Aplikasi

**Prasyarat:** Flutter SDK (versi 3.27 atau lebih baru), Android Studio dengan plugin Flutter dan Dart, serta emulator Android atau perangkat fisik.

1. Clone repositori ini:
   ```
   git clone https://github.com/[USERNAME]/[NAMA-REPO].git
   ```
2. Buka folder proyek di Android Studio (folder yang berisi `pubspec.yaml`).
3. Jika folder `android/` belum ada, buat dengan perintah:
   ```
   flutter create . --platforms=android
   ```
4. Unduh dependensi:
   ```
   flutter pub get
   ```
5. Jalankan emulator atau sambungkan perangkat, lalu pilih perangkat tersebut di Android Studio.
6. Jalankan aplikasi dengan tombol Run atau perintah:
   ```
   flutter run
   ```

**Jika muncul error aset:** pastikan file `assets/data/plants.json` ada dan terdaftar di `pubspec.yaml`, lalu jalankan `flutter clean` dan `flutter pub get`.

## Rencana Pengembangan

- Menghubungkan data ke server melalui API (ubah `plant_repository.dart`).
- Menambahkan foto tanaman.
- Menambahkan fitur pencarian.
