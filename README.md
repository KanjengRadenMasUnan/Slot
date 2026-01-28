<img width="1920" height="1080" alt="lobby" src="https://github.com/user-attachments/assets/f21f25a7-fb14-42f9-ac84-ad9d3ea53f3d" /># 🎰 Slot Game Application - UAS Project

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
```
## 🚀 Cara Menjalankan (How to Run)
Ikuti langkah-langkah berikut untuk menjalankan aplikasi di browser:

1. Buka Project: Buka folder project ini menggunakan VS Code.

2. Terminal: Buka terminal di VS Code (Ctrl + `).

3. Run: Ketik perintah berikut dan tekan Enter:

Bash
flutter run

4. Pilih Device: Jika diminta memilih device, pilih angka yang sesuai dengan Chrome atau Edge (Web Browser).

5. Selesai: Tunggu proses compiling selesai, browser akan otomatis terbuka menampilkan aplikasi.

---

## 🎮 Panduan Penggunaan

1. Registrasi: Saat aplikasi terbuka, lakukan pendaftaran akun baru terlebih dahulu.

2. Login: Masuk menggunakan username dan password yang baru saja dibuat.

3. Main Game:

Tekan tombol putar (spin) untuk bermain.

Saldo (balance) akan terupdate otomatis ke database slot_db.

---

## 📸 Dokumentasi Aplikasi

Berikut adalah tampilan antarmuka (UI) dari **Imperium Slots**:

| **1. Halaman Login** | **2. Halaman Pendaftaran** |
|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/32df49cf-0290-4246-b6af-213cbccb8291" alt="Login Screen" width="100%"> | <img src="https://github.com/user-attachments/assets/97e6a738-1207-41de-9e8e-dfe33e952246" alt="Register Screen" width="100%"> |
| *Masuk dengan akun yang aman* | *Registrasi user baru dengan validasi* |

<br>

| **3. Halaman Lobby (Home)** | **4. Permainan Slot (Gameplay)** |
|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/47bb3b22-0614-4f60-970f-3e74db22c149" alt="Lobby Screen" width="100%"> | <img src="https://github.com/user-attachments/assets/daa3609f-c61c-401e-8cdb-355ee6600657" alt="Game Screen" width="100%"> |
| *Dashboard interaktif & saldo realtime* | *Mesin slot dengan animasi & logika RNG* |

<p align="center"> Created with ❤️ by <b>Kelompok 2</b> </p>
