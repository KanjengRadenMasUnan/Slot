# 🎰 Slot Game Application - UAS Project

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Laragon](https://img.shields.io/badge/Laragon-Tool-blue?style=for-the-badge)

> **Pengajuan Project UAS (Ujian Akhir Semester)**
>
> Repository ini berisi *source code* aplikasi permainan slot berbasis web/mobile yang terintegrasi dengan database MySQL.

---

## 👥 Profil Kelompok 2

Tim pengembang yang bertugas dalam proyek ini:

| No | Nama Anggota | Role / Tanggung Jawab |
|:--:|:---|:---|
| 1 | **Unan Nurwenda** | 👑 Project Manager |
| 2 | **Pizar Almaulidina** | 🎨 Frontend Developer |
| 3 | **Muhammad Rifan** | ⚙️ Backend Developer |
| 4 | **Ahmad Hadi Fauzan** | 🗄️ Database Developer |
| 5 | **Izzul Ahmad Fatoni** | 🧪 Tester |
| 6 | **Fikri Firdaus** | 📝 Dokumentasi |

---

## 💻 Tech Stack

* **Framework**: Flutter
* **Language**: Dart
* **Database**: MySQL
* **Server Tool**: Laragon
* **IDE**: Visual Studio Code

---

## ⚙️ Persiapan Database (Database Setup)

Sebelum menjalankan aplikasi, database harus disiapkan terlebih dahulu menggunakan Laragon.

1.  Buka **Laragon** dan klik tombol **Start All**.
2.  Buka Database Manager (HeidiSQL / phpMyAdmin).
3.  Buat database baru dengan nama: `slot_db`
4.  Buka tab **Query** dan jalankan perintah SQL berikut untuk membuat tabel:

```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL, -- Password disimpan (disarankan hash MD5/Bcrypt)
    balance DECIMAL(15,2) DEFAULT 0
);


🚀 Cara Menjalankan (How to Run)
Ikuti langkah-langkah berikut untuk menjalankan aplikasi di browser:

Buka Project: Buka folder project ini menggunakan VS Code.

Terminal: Buka terminal di VS Code (Ctrl + `).

Run: Ketik perintah berikut dan tekan Enter:

Bash
flutter run
Pilih Device: Jika diminta memilih device, pilih angka yang sesuai dengan Chrome atau Edge (Web Browser).

Selesai: Tunggu proses compiling selesai, browser akan otomatis terbuka menampilkan aplikasi.

🎮 Panduan Penggunaan
Registrasi: Saat aplikasi terbuka, lakukan pendaftaran akun baru terlebih dahulu.

Login: Masuk menggunakan username dan password yang baru saja dibuat.

Main Game:

Tekan tombol putar (spin) untuk bermain.

Saldo (balance) akan terupdate otomatis ke database slot_db.

📸 Dokumentasi
Dokumentasi proses pengembangan dan hasil testing aplikasi.

(Bagian ini dapat diisi dengan screenshot aplikasi yang diambil oleh tim dokumentasi)

<p align="center"> Created with ❤️ by <b>Kelompok 2</b> </p>
