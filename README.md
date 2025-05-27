# <img src="https://private-user-images.githubusercontent.com/74038190/250967242-a2605358-6b87-44ab-87fb-20dcdc5f9ef2.gif?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDM3NjgzMjksIm5iZiI6MTc0Mzc2ODAyOSwicGF0aCI6Ii83NDAzODE5MC8yNTA5NjcyNDItYTI2MDUzNTgtNmI4Ny00NGFiLTg3ZmItMjBkY2RjNWY5ZWYyLmdpZj9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA0MDQlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNDA0VDEyMDAyOVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWYyZWEyMjhlMTIwNzRkNTE2MWJlZGMxMjk1MGEzMWY3MDAyNjc4NzY1MjZiOWNhM2ZkNjZjMzk2MGJkZGZlYTcmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.zyYzSHuTf1EogsfGONRy7WMqZSTc6g965QbA3pKlFWM" width="50" height="50" /> Topic 5 Navigasi Pemrograman Berbasis Mobile <img src="https://user-images.githubusercontent.com/74038190/212284087-bbe7e430-757e-4901-90bf-4cd2ce3e1852.gif" alt="Exploding Head" width="50" height="50" /> 

icon | Nama | NPM |
:---: | :---: | :---: 
<img src="https://user-images.githubusercontent.com/74038190/216654095-6f6772e4-e433-4bba-9164-1ca6f463ac3f.gif" alt="Face in Clouds" width="50" height="50" />| Muhammad Sulthan Zharfan | 4522210016 | `SultanZharfan`
---

## 📝 Deskripsi

Ini adalah tugas prak.PBM ke-5

---

## 📸 Laporan
Berikut adalah penjelasan singkat dan screenshot dari hasil kodingan saya:

## 1.Navigasi
## Penjelasan Singkat:
Tujuan dari praktikum ini adalah untuk memberikan pemahaman kepada mahasiswa tentang bagaimana cara menerapkan navigasi antar halaman (routing) dalam aplikasi Flutter. Mahasiswa belajar menggunakan dua metode navigasi, yaitu push biasa dan named route, agar aplikasi bisa berpindah dari satu layar ke layar lainnya. Selain itu, praktikum ini juga mengajarkan cara mengirim data antar halaman dan menampilkan halaman baru berdasarkan argumen yang diberikan.
Pada kode program ini, terdapat empat layar utama yaitu HomeScreen, DetailScreen, SettingsScreen, dan InfoPengguna. Layar HomeScreen berisi tombol-tombol navigasi yang mengarahkan ke halaman lain. Ketika pengguna menekan tombol, aplikasi menggunakan widget Navigator untuk berpindah ke layar tujuan. Untuk layar DetailScreen, data dikirim secara langsung melalui konstruktor maupun lewat named route. Layar SettingsScreen menerima data username melalui arguments dan menampilkannya. Lalu, layar InfoPengguna merupakan tambahan halaman yang menampilkan informasi statis seperti nama, NPM, dan kota asal.
## Screen Shot
![Screenshot (139)](https://github.com/user-attachments/assets/ceea81c7-757a-4749-93a0-f57187473a4b)
![Screenshot (140)](https://github.com/user-attachments/assets/27cce547-3820-4da7-9943-47de7ccc331f)

## 2.Navigasi 2.0
## Penjelasan Singkat:
Tujuan dari praktikum ini adalah untuk memberikan pemahaman kepada mahasiswa mengenai implementasi navigasi dinamis menggunakan Navigator 2.0 dalam pengembangan aplikasi Flutter. Dengan pendekatan ini, mahasiswa dapat mempelajari bagaimana cara berpindah antar halaman (screen) menggunakan daftar pages yang bersifat deklaratif, serta bagaimana memanipulasi state navigasi tanpa menggunakan push/pop secara langsung.
Dalam kode yang dibuat, aplikasi menampilkan daftar item pada halaman utama (HomeScreen) yang bisa diklik untuk melihat detail dari item tersebut pada halaman selanjutnya (DetailScreen). Saat salah satu item dipilih, state _selectedItem akan berubah dan menyebabkan sistem menambahkan halaman detail ke dalam stack navigasi. Navigasi ini dikendalikan oleh widget Navigator, yang digunakan secara langsung tanpa MaterialApp.router. Komponen MaterialPage digunakan untuk mewakili halaman yang muncul, dan onPopPage menangani aksi ketika pengguna menekan tombol back.
Widget utama yang berperan dalam navigasi ini adalah Navigator, MaterialPage, dan StatelessWidget seperti HomeScreen dan DetailScreen. Selain itu, StatefulWidget digunakan di kelas MyApp untuk mengelola dan merender tampilan berdasarkan state yang berubah.
## Screen Shot
![Screenshot (141)](https://github.com/user-attachments/assets/5ab5706a-0595-49ba-a20a-80e9ffbb61c8)

## 3. Nested Navigation
## Penjelasan Singkat:
Tujuan dari praktikum ini adalah untuk memahami bagaimana cara menerapkan nested navigation dalam aplikasi Flutter menggunakan widget Navigator. Dengan nested navigation, kita bisa membuat alur navigasi yang terpisah dari navigasi utama, yang sangat berguna ketika membuat proses multi-langkah atau wizard setup dalam satu layar tersendiri.
Pada program ini, aplikasi terdiri dari halaman utama HomeScreen dan satu alur pengaturan perangkat yang disebut SetupFlowScreen. Di dalam SetupFlowScreen, digunakan widget Navigator dengan GlobalKey sendiri agar navigasinya bisa berdiri sendiri (independen) dari navigator utama aplikasi. Alur ini terdiri dari tiga halaman: FindDevicesScreen, ConnectDeviceScreen, dan ConfirmDeviceScreen, yang diakses menggunakan pushNamed.
Tiap halaman menggunakan widget seperti Scaffold untuk struktur utama, AppBar sebagai header, Column dan Center untuk menyusun tampilan tengah, serta ElevatedButton untuk interaksi antar halaman. Logika navigasi disusun dengan metode onGenerateRoute yang menangani perubahan layar berdasarkan route name yang diberikan. Hal ini menunjukkan penggunaan praktis dari widget Navigator, MaterialPageRoute, dan StatelessWidget/StatefulWidget dalam membangun navigasi bersarang.
## Screen Shot
![Screenshot (142)](https://github.com/user-attachments/assets/2b4b9dba-dc05-4470-901a-7bd937e21ed7)
![Screenshot (143)](https://github.com/user-attachments/assets/417c8617-be89-497d-9d7f-2f56d80d1b14)

## 4. Deep Link Navigation
## Penjelasan Singkat:
Tujuan dari praktikum ini adalah untuk memberikan pemahaman kepada mahasiswa mengenai implementasi navigasi tingkat lanjut pada aplikasi Flutter menggunakan pendekatan Navigator 2.0 (Router API). Praktikum ini mengajarkan bagaimana cara membuat aplikasi yang mampu menangani deep linking, yaitu membuka halaman tertentu berdasarkan URL secara langsung, seperti /, /detail/1, atau /settings. Dalam implementasinya, digunakan beberapa komponen penting seperti RouteInformationParser untuk menerjemahkan URL menjadi state aplikasi, serta RouterDelegate untuk membangun tampilan berdasarkan state tersebut. Aplikasi terdiri dari tiga layar utama: HomeScreen, DetailScreen, dan SettingsScreen, dengan tampilan daftar item yang bisa diklik dan tombol untuk berpindah ke menu pengaturan. Selain fokus pada navigasi, praktikum ini juga melibatkan berbagai widget penting seperti MaterialApp.router untuk mengatur rute berbasis URL, Navigator dan MaterialPage untuk mengelola halaman dalam stack navigasi, serta ListView.builder dan ListTile untuk menampilkan daftar item.
## Screen Shot
![Screenshot (144)](https://github.com/user-attachments/assets/3ee2b4af-2c2c-4353-b693-c93443de4de6)
![Screenshot (145)](https://github.com/user-attachments/assets/35b6f1b7-c14a-4679-b534-bbcd6006ab04)
---
