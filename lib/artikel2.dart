import 'package:flutter/material.dart'; // Mengimpor paket Flutter Material untuk menggunakan widget UI.

class Article2Page extends StatelessWidget { // Mendefinisikan halaman artikel sebagai widget stateless.
  const Article2Page({super.key}); // Konstruktor yang digunakan untuk menginisialisasi halaman ini dengan key.

  @override
  Widget build(BuildContext context) { // Override method build untuk membangun UI halaman.
    return Scaffold( // Scaffold adalah struktur dasar halaman yang menyertakan AppBar, body, dll.
      body: Container( // Kontainer untuk membungkus seluruh konten halaman.
        decoration: const BoxDecoration( // Dekorasi untuk memberi background gradient.
          gradient: LinearGradient( // Menggunakan gradient linear untuk latar belakang.
            colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)], // Warna gradient biru tua ke biru terang.
            begin: Alignment.topCenter, // Gradien dimulai dari bagian atas.
            end: Alignment.bottomCenter, // Gradien berakhir di bagian bawah.
          ),
        ),
        child: SafeArea( // SafeArea memastikan konten tidak terhalang oleh status bar atau notch.
          child: Column( // Menggunakan kolom untuk menyusun widget secara vertikal.
            children: [
              // Header
              Padding( // Padding untuk memberi ruang di sekitar header.
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22), // Padding horizontal dan vertikal.
                child: Row( // Menggunakan baris untuk menyusun widget secara horizontal.
                  children: [
                    Container( // Kontainer untuk tombol kembali.
                      padding: const EdgeInsets.all(8), // Padding di dalam kontainer.
                      decoration: BoxDecoration( // Menambahkan dekorasi pada kontainer.
                      ),
                      child: GestureDetector( // GestureDetector mendeteksi ketukan untuk kembali.
                        onTap: () => Navigator.pop(context), // Menangani ketukan dengan menavigasi kembali.
                        child: const Icon(Icons.arrow_back_ios, color: Colors.white), // Ikon panah kembali.
                      ),
                    ),
                    const SizedBox(width: 14), // Memberi ruang antara ikon dan judul.
                    const Text( // Menampilkan teks judul halaman.
                      'Study Master',
                      style: TextStyle(
                        color: Colors.white, // Teks berwarna putih.
                        fontSize: 22, // Ukuran font untuk judul.
                        fontWeight: FontWeight.bold, // Menebalkan font.
                      ),
                    ),
                    const Spacer(), // Spacer untuk memberi ruang secara otomatis di antara elemen.
                    const Icon(Icons.menu_book_rounded, color: Colors.yellowAccent, size: 28), // Ikon menu buku.
                  ],
                ),
              ),

              // Isi Artikel
              Expanded( // Expanded membuat konten di bawah header mengisi ruang yang tersisa.
                child: SingleChildScrollView( // SingleChildScrollView memungkinkan konten untuk di-scroll.
                  padding: const EdgeInsets.all(20), // Padding di sekitar konten artikel.
                  child: Column( // Menyusun artikel secara vertikal.
                    crossAxisAlignment: CrossAxisAlignment.start, // Menyusun konten di kiri.
                    children: [
                      const Text( // Menampilkan judul artikel.
                        'Mengatasi Rasa Malas: Tips Agar Konsisten dengan Jadwal yang Sudah Dibuat',
                        style: TextStyle(
                          fontSize: 22, // Ukuran font untuk judul artikel.
                          fontWeight: FontWeight.bold, // Menebalkan font.
                          color: Colors.white, // Warna teks putih.
                        ),
                      ),
                      const SizedBox(height: 8), // Memberi ruang di antara teks.
                      Row( // Baris untuk menampilkan waktu baca artikel.
                        children: const [
                          Icon(Icons.access_time, size: 16, color: Colors.white70), // Ikon waktu.
                          SizedBox(width: 6), // Memberi ruang antara ikon dan teks.
                          Text(
                            '5 menit baca', // Teks durasi baca.
                            style: TextStyle(color: Colors.white70, fontSize: 14), // Gaya teks.
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Memberi ruang setelah informasi waktu baca.
                      const Text( // Paragraf pertama dari artikel.
                        'Banyak orang mengalami kesulitan untuk tetap konsisten dengan jadwal yang sudah mereka buat. Namun, ada beberapa cara yang bisa kamu lakukan untuk mengatasi rasa malas dan tetap disiplin. Berikut adalah beberapa tips untuk membantu kamu tetap konsisten:',
                        style: TextStyle(fontSize: 16, height: 1.6, color: Colors.white), // Gaya teks untuk artikel.
                      ),
                      const SizedBox(height: 16), // Memberi ruang sebelum daftar tips.
                      // Daftar tips artikel
                      const _ArticlePoint(number: '1', title: 'Tetapkan Tujuan yang Jelas', description: 'Pastikan kamu tahu apa yang ingin dicapai. Menetapkan tujuan yang jelas dapat memberi motivasi untuk tetap konsisten.'),
                      const _ArticlePoint(number: '2', title: 'Buat Jadwal yang Realistis', description: 'Jadwal yang terlalu padat hanya akan membuatmu merasa kewalahan. Sesuaikan jadwal dengan kemampuanmu dan jangan lupa untuk memberi waktu untuk istirahat.'),
                      const _ArticlePoint(number: '3', title: 'Temukan Sumber Motivasi', description: 'Cari tahu apa yang memotivasi dirimu. Bisa berupa imbalan setelah menyelesaikan tugas atau membayangkan hasil yang ingin dicapai.'),
                      const _ArticlePoint(number: '4', title: 'Lakukan dengan Bertahap', description: 'Jangan mencoba untuk mengubah segalanya dalam satu waktu. Mulailah dengan langkah kecil, dan bertahap tingkatkan tantangan seiring berjalannya waktu.'),
                      const _ArticlePoint(number: '5', title: 'Perbaiki Lingkungan Kerja', description: 'Lingkungan yang mendukung sangat penting untuk fokus. Pastikan kamu bekerja di tempat yang nyaman dan bebas dari gangguan.'),
                      const SizedBox(height: 24), // Memberi ruang setelah daftar tips.
                      const Text( // Paragraf terakhir dari artikel.
                        'Dengan menerapkan tips di atas, kamu bisa mengatasi rasa malas dan tetap konsisten dalam mengikuti jadwal yang sudah dibuat. Jangan lupa untuk memberi dirimu penghargaan atas setiap kemajuan yang dicapai.',
                        style: TextStyle(fontSize: 16, height: 1.6, color: Colors.white), // Gaya teks.
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArticlePoint extends StatelessWidget { // Widget untuk menampilkan poin artikel.
  final String number; // Variabel untuk nomor urut artikel.
  final String title; // Variabel untuk judul poin artikel.
  final String description; // Variabel untuk deskripsi poin artikel.

  const _ArticlePoint({ // Konstruktor untuk menginisialisasi variabel.
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) { // Method untuk membangun tampilan artikel.
    return Padding( // Padding untuk memberi ruang di sekitar elemen poin.
      padding: const EdgeInsets.only(bottom: 18), // Memberi ruang bawah pada setiap poin artikel.
      child: Row( // Menyusun elemen poin secara horizontal.
        crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen di kiri.
        children: [
          CircleAvatar( // Menampilkan lingkaran dengan nomor urut di tengah.
            radius: 14, // Ukuran radius lingkaran.
            backgroundColor: const Color(0xFF1A3F8B), // Warna latar belakang lingkaran.
            child: Text( // Menampilkan nomor urut di tengah lingkaran.
              number,
              style: const TextStyle(color: Colors.white, fontSize: 14), // Gaya teks untuk nomor.
            ),
          ),
          const SizedBox(width: 12), // Memberi ruang antara lingkaran dan teks.
          Expanded( // Menggunakan Expanded agar teks bisa mengisi ruang yang tersedia.
            child: Column( // Menyusun elemen secara vertikal.
              crossAxisAlignment: CrossAxisAlignment.start, // Menyusun teks di kiri.
              children: [
                Text( // Menampilkan judul poin artikel.
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600, // Menebalkan teks judul.
                    fontSize: 16, // Ukuran font untuk judul.
                    color: Colors.white, // Warna teks putih.
                  ),
                ),
                const SizedBox(height: 4), // Memberi ruang antara judul dan deskripsi.
                Text( // Menampilkan deskripsi poin artikel.
                  description,
                  style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.white70), // Gaya teks untuk deskripsi.
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
