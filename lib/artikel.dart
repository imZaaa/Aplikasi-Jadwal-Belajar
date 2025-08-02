import 'package:flutter/material.dart';  // Mengimpor paket material untuk membuat UI di Flutter
import 'artikel1.dart';  // Mengimpor file artikel1.dart untuk halaman artikel 1
import 'artikel2.dart';  // Mengimpor file artikel2.dart untuk halaman artikel 2
import 'artikel3.dart';  // Mengimpor file artikel3.dart untuk halaman artikel 3

// Mendeklarasikan kelas ArticlePage yang akan menampilkan halaman artikel
class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});  // Konstruktor untuk ArticlePage

  @override
  Widget build(BuildContext context) {
    // Daftar artikel dengan data judul dan durasi membaca
    final List<Map<String, String>> articles = [
      {
        'title': '5 Cara efektif mengatur jadwal harian untuk pelajar sibuk',
        'duration': '4 menit baca',  // Artikel pertama dengan judul dan durasi
      },
      {
        'title': 'Mengatasi Rasa Malas: Tips Agar Konsisten dengan Jadwal yang Sudah Dibuat',
        'duration': '3 menit baca',  // Artikel kedua dengan judul dan durasi
      },
      {
        'title': 'Aplikasi Wajib untuk Bantu Kamu Lebih Produktif Setiap Hari',
        'duration': '5 menit baca',  // Artikel ketiga dengan judul dan durasi
      },
    ];

    return Scaffold(  // Scaffold adalah struktur dasar halaman
      body: Container(  // Container untuk menampung seluruh konten dalam halaman
        decoration: const BoxDecoration(  // Mengatur tampilan latar belakang dengan gradient
          gradient: LinearGradient(
            colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],  // Warna gradient biru
            begin: Alignment.topCenter,  // Gradien dimulai dari atas
            end: Alignment.bottomCenter,  // Gradien berakhir di bawah
          ),
        ),
        child: SafeArea(  // SafeArea memastikan konten tidak tertutup oleh status bar
          child: Column(  // Column untuk menyusun widget secara vertikal
            children: [
              // Header dengan navigasi kembali dan judul halaman
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),  // Padding di sekitar header
                child: Row(  // Row untuk menata item secara horizontal
                  children: [
                    Container(  // Kontainer untuk ikon kembali
                      padding: const EdgeInsets.all(8),  // Padding di dalam kontainer
                      child: GestureDetector(  // GestureDetector untuk menangani tap pada ikon
                        onTap: () {  // Menangani aksi ketika ikon dipencet
                          Navigator.pop(context);  // Kembali ke halaman sebelumnya
                        },
                        child: const Icon(  // Ikon panah kembali
                          Icons.arrow_back_ios,
                          color: Colors.white,  // Warna ikon putih
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),  // Spacer untuk jarak antar elemen
                    const Text(  // Judul halaman
                      'Study Master',  // Teks untuk judul
                      style: TextStyle(
                        color: Colors.white,  // Warna teks putih
                        fontSize: 22,  // Ukuran font judul
                        fontWeight: FontWeight.bold,  // Gaya font tebal
                      ),
                    ),
                    const Spacer(),  // Spacer untuk mengisi ruang kosong di antara elemen
                    const Icon(Icons.menu_book_rounded, color: Colors.yellowAccent, size: 28),  // Ikon buku menu
                  ],
                ),
              ),

              // Deskripsi artikel
              Padding(
                padding: const EdgeInsets.all(16.0),  // Padding di sekitar deskripsi
                child: Container(  // Container untuk menampung deskripsi
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),  // Padding dalam kontainer
                  decoration: BoxDecoration(  // Mengatur dekorasi kontainer
                    color: Colors.white.withOpacity(0.1),  // Warna latar belakang dengan transparansi
                    borderRadius: BorderRadius.circular(16),  // Sudut kontainer melengkung
                    boxShadow: [  // Menambahkan efek bayangan
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),  // Warna bayangan dengan transparansi
                        blurRadius: 6,  // Jarak blur bayangan
                        offset: const Offset(0, 3),  // Offset bayangan
                      ),
                    ],
                  ),
                  child: Row(  // Menyusun elemen deskripsi secara horizontal
                    crossAxisAlignment: CrossAxisAlignment.start,  // Menyusun elemen pada bagian atas
                    children: [
                      const Icon(Icons.info_outline, color: Colors.blueAccent, size: 28),  // Ikon informasi
                      const SizedBox(width: 12),  // Spacer antara ikon dan teks
                      const Expanded(  // Expanded untuk memaksimalkan lebar teks
                        child: Text(
                          "Temukan berbagai tips dan trik untuk membantumu mengatur waktu dan belajar dengan lebih efektif.",
                          style: TextStyle(
                            fontSize: 15,  // Ukuran font deskripsi
                            color: Colors.white,  // Warna teks putih
                            height: 1.6,  // Tinggi baris teks
                          ),
                          textAlign: TextAlign.left,  // Menyusun teks ke kiri
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Daftar artikel
              Expanded(  // Expanded untuk memaksimalkan ruang yang tersisa
                child: ListView.builder(  // Membuat daftar dinamis menggunakan ListView.builder
                  padding: const EdgeInsets.symmetric(horizontal: 16),  // Padding pada sisi kiri dan kanan
                  itemCount: articles.length,  // Menentukan jumlah item berdasarkan panjang daftar artikel
                  itemBuilder: (context, index) {  // Membangun setiap item berdasarkan index
                    return _buildArticleCard(  // Memanggil fungsi untuk membangun kartu artikel
                      context,
                      index + 1,  // Menampilkan nomor artikel
                      articles[index]['title']!,  // Judul artikel
                      articles[index]['duration']!,  // Durasi membaca artikel
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun kartu artikel
  Widget _buildArticleCard(
    BuildContext context,
    int number,  // Nomor artikel
    String title,  // Judul artikel
    String duration,  // Durasi membaca artikel
  ) {
    return InkWell(  // InkWell untuk menangani tap pada kartu artikel
      onTap: () {  // Aksi ketika kartu artikel diketuk
        if (number == 1) {  // Jika nomor artikel 1
          Navigator.push(  // Pindah ke halaman artikel 1
            context,
            MaterialPageRoute(builder: (_) => const Article1Page()),
          );
        } else if (number == 2) {  // Jika nomor artikel 2
          Navigator.push(  // Pindah ke halaman artikel 2
            context,
            MaterialPageRoute(builder: (_) => const Article2Page()),
          );
        } else if (number == 3) {  // Jika nomor artikel 3
          Navigator.push(  // Pindah ke halaman artikel 3
            context,
            MaterialPageRoute(builder: (_) => const Article3Page()),
          );
        }
      },
      borderRadius: BorderRadius.circular(20),  // Sudut kartu melengkung
      child: Container(  // Kontainer untuk kartu artikel
        margin: const EdgeInsets.only(bottom: 16),  // Margin di bawah kartu
        padding: const EdgeInsets.all(20),  // Padding di dalam kartu
        decoration: BoxDecoration(  // Mengatur dekorasi kartu
          gradient: const LinearGradient(  // Gradien latar belakang kartu
            colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],  // Warna gradien biru
            begin: Alignment.topLeft,  // Gradien dimulai dari kiri atas
            end: Alignment.bottomRight,  // Gradien berakhir di kanan bawah
          ),
          borderRadius: BorderRadius.circular(20),  // Sudut kartu melengkung
          boxShadow: [  // Menambahkan efek bayangan pada kartu
            BoxShadow(
              color: Colors.black.withOpacity(0.15),  // Warna bayangan dengan transparansi
              blurRadius: 12,  // Jarak blur bayangan
              offset: const Offset(0, 6),  // Offset bayangan
            ),
          ],
        ),
        child: Row(  // Menyusun elemen kartu secara horizontal
          children: [
            Container(  // Kontainer untuk nomor artikel
              width: 46,  // Lebar kontainer
              height: 46,  // Tinggi kontainer
              decoration: BoxDecoration(  // Mengatur dekorasi kontainer
                gradient: const LinearGradient(  // Gradien latar belakang lingkaran
                  colors: [Color(0xFF6DA7FF), Color(0xFF468AFF)],  // Warna gradien biru
                  begin: Alignment.topLeft,  // Gradien dimulai dari kiri atas
                  end: Alignment.bottomRight,  // Gradien berakhir di kanan bawah
                ),
                shape: BoxShape.circle,  // Bentuk kontainer berbentuk lingkaran
              ),
              alignment: Alignment.center,  // Menyusun nomor artikel di tengah lingkaran
              child: Text(
                number.toString(),  // Menampilkan nomor artikel
                style: const TextStyle(
                  fontSize: 18,  // Ukuran font nomor artikel
                  fontWeight: FontWeight.bold,  // Gaya font tebal
                  color: Colors.white,  // Warna font putih
                ),
              ),
            ),
            const SizedBox(width: 16),  // Spacer antara nomor dan teks artikel
            Expanded(  // Expanded agar teks judul artikel memaksimalkan ruang
              child: Column(  // Menyusun teks judul dan durasi secara vertikal
                crossAxisAlignment: CrossAxisAlignment.start,  // Menyusun elemen ke kiri
                children: [
                  Text(  // Teks untuk judul artikel
                    title,
                    style: const TextStyle(
                      fontSize: 16,  // Ukuran font judul
                      color: Colors.white,  // Warna teks putih
                      fontWeight: FontWeight.w600,  // Gaya font sedang
                    ),
                    maxLines: 2,  // Maksimal dua baris untuk judul
                    overflow: TextOverflow.ellipsis,  // Teks yang terlalu panjang akan dipotong
                  ),
                  const SizedBox(height: 4),  // Jarak antara judul dan durasi
                  Row(  // Row untuk menyusun ikon durasi dan teks durasi
                    children: [
                      const Icon(Icons.access_time, size: 14, color: Colors.white70),  // Ikon waktu
                      const SizedBox(width: 4),  // Spacer
                      Text(
                        duration,  // Teks durasi
                        style: const TextStyle(fontSize: 13, color: Colors.white70),  // Gaya font durasi
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),  // Spacer
            Container(  // Kontainer untuk ikon panah
              padding: const EdgeInsets.all(8),  // Padding di dalam kontainer
              child: const Icon(Icons.arrow_forward_ios, color: Colors.white),  // Ikon panah maju
            ),
          ],
        ),
      ),
    );
  }
}