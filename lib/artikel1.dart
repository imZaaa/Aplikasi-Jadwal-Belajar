import 'package:flutter/material.dart';

class Article1Page extends StatelessWidget {
  const Article1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold adalah widget dasar untuk struktur halaman.
      body: Container( // Container untuk membungkus semua konten halaman.
        decoration: const BoxDecoration( // Menambahkan dekorasi pada container.
          gradient: LinearGradient( // Membuat latar belakang gradien linear.
            colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)], // Warna gradien dari biru tua ke biru muda.
            begin: Alignment.topCenter, // Gradien dimulai dari bagian atas.
            end: Alignment.bottomCenter, // Gradien berakhir di bagian bawah.
          ),
        ),
        child: SafeArea( // SafeArea memastikan konten tidak tertutup oleh notifikasi atau area perangkat lainnya.
          child: Column( // Menggunakan Column untuk menyusun widget secara vertikal.
            children: [
              // Header bagian atas artikel
              Padding( // Padding untuk memberi jarak antara konten dan tepi layar.
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22), // Menambahkan padding di kanan, kiri, atas, dan bawah.
                child: Row( // Menggunakan Row untuk meletakkan widget secara horizontal.
                  children: [
                    Container( // Kontainer untuk tombol kembali.
                      padding: const EdgeInsets.all(8), // Padding di dalam kontainer.
                      decoration: BoxDecoration( // Dekorasi untuk tombol kembali, tidak ada gaya khusus.
                      ),
                      child: GestureDetector( // GestureDetector untuk mendeteksi ketukan.
                        onTap: () => Navigator.pop(context), // Navigasi kembali ke halaman sebelumnya.
                        child: const Icon(Icons.arrow_back_ios, color: Colors.white), // Ikon panah kembali.
                      ),
                    ),
                    const SizedBox(width: 14), // Memberi jarak antara tombol dan teks.
                    const Text( // Teks judul aplikasi.
                      'Study Master',
                      style: TextStyle(
                        color: Colors.white, // Mengatur warna teks menjadi putih.
                        fontSize: 22, // Mengatur ukuran font.
                        fontWeight: FontWeight.bold, // Mengatur ketebalan font.
                      ),
                    ),
                    const Spacer(), // Spacer untuk memberikan ruang kosong di antara widget.
                    const Icon(Icons.menu_book_rounded, color: Colors.yellowAccent, size: 28), // Ikon buku menu di kanan.
                  ],
                ),
              ),

              // Isi artikel
              Expanded( // Expanded untuk mengisi ruang yang tersedia dengan konten artikel.
                child: SingleChildScrollView( // SingleChildScrollView agar konten bisa digulirkan.
                  padding: const EdgeInsets.all(20), // Padding di sekitar konten artikel.
                  child: Column( // Menggunakan Column untuk menata konten secara vertikal.
                    crossAxisAlignment: CrossAxisAlignment.start, // Mengatur agar konten diratakan ke kiri.
                    children: [
                      // Judul artikel
                      const Text(
                        '5 Cara Efektif Mengatur Jadwal Harian untuk Pelajar Sibuk',
                        style: TextStyle(
                          fontSize: 22, // Ukuran font judul artikel.
                          fontWeight: FontWeight.bold, // Menebalkan font judul.
                          color: Colors.white, // Warna font putih.
                        ),
                      ),
                      const SizedBox(height: 8), // Memberi jarak antar elemen.
                      Row( // Baris untuk menampilkan informasi waktu baca.
                        children: const [
                          Icon(Icons.access_time, size: 16, color: Colors.white70), // Ikon jam untuk menunjukkan waktu baca.
                          SizedBox(width: 6), // Memberi jarak antara ikon dan teks.
                          Text(
                            '4 menit baca',
                            style: TextStyle(color: Colors.white70, fontSize: 14), // Teks waktu baca.
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Memberi jarak sebelum paragraf berikutnya.

                      // Paragraf pertama dari artikel
                      const Text(
                        'Mengelola waktu secara efektif adalah kunci bagi pelajar yang memiliki banyak aktivitas. Berikut lima cara yang bisa kamu terapkan:',
                        style: TextStyle(fontSize: 16, height: 1.6, color: Colors.white), // Deskripsi awal artikel.
                      ),
                      const SizedBox(height: 16), // Memberi jarak antar elemen.

                      // Menampilkan poin artikel
                      const _ArticlePoint(
                        number: '1',
                        title: 'Gunakan Metode Blok Waktu',
                        description:
                            'Bagi harimu menjadi blok waktu khusus untuk belajar, istirahat, dan kegiatan lainnya. Ini membantumu fokus tanpa terganggu oleh hal lain.',
                      ),
                      const _ArticlePoint(
                        number: '2',
                        title: 'Buat Skala Prioritas Tugas',
                        description:
                            'Identifikasi tugas yang paling penting dan selesaikan terlebih dahulu. Gunakan metode Eisenhower Matrix atau daftar prioritas harian.',
                      ),
                      const _ArticlePoint(
                        number: '3',
                        title: 'Hindari Multitasking',
                        description:
                            'Fokus pada satu tugas dalam satu waktu agar hasilnya lebih maksimal. Multitasking hanya akan membuatmu lebih lelah dan kurang efisien.',
                      ),
                      const _ArticlePoint(
                        number: '4',
                        title: 'Gunakan Aplikasi Pengelola Waktu',
                        description:
                            'Manfaatkan aplikasi seperti Google Calendar, Notion, atau Todoist untuk mengatur jadwal dan mengingatkan deadline penting.',
                      ),
                      const _ArticlePoint(
                        number: '5',
                        title: 'Luangkan Waktu untuk Istirahat',
                        description:
                            'Jangan lupakan waktu istirahat. Otak butuh waktu untuk memulihkan energi agar tetap produktif sepanjang hari.',
                      ),
                      const SizedBox(height: 24), // Memberi jarak sebelum paragraf terakhir.
                      const Text(
                        'Dengan menerapkan strategi di atas, kamu bisa lebih terorganisir dan tetap produktif meskipun memiliki jadwal yang padat.',
                        style: TextStyle(fontSize: 16, height: 1.6, color: Colors.white), // Kesimpulan artikel.
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

// Widget untuk menampilkan setiap poin artikel
class _ArticlePoint extends StatelessWidget {
  final String number; // Nomor urut artikel
  final String title; // Judul setiap poin artikel
  final String description; // Deskripsi dari setiap poin artikel

  const _ArticlePoint({
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding( // Memberi padding di bawah setiap poin artikel.
      padding: const EdgeInsets.only(bottom: 18),
      child: Row( // Row untuk meletakkan gambar (nomor) dan teks secara horizontal.
        crossAxisAlignment: CrossAxisAlignment.start, // Menjaga posisi nomor di atas teks.
        children: [
          CircleAvatar( // Membuat lingkaran untuk nomor urut.
            radius: 14, // Ukuran lingkaran.
            backgroundColor: const Color(0xFF1A3F8B), // Warna latar lingkaran.
            child: Text(
              number, // Menampilkan nomor urut di dalam lingkaran.
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          const SizedBox(width: 12), // Memberi jarak antara lingkaran dan teks.
          Expanded( // Expanded untuk memberi ruang yang lebih pada teks.
            child: Column( // Menata teks judul dan deskripsi secara vertikal.
              crossAxisAlignment: CrossAxisAlignment.start, // Meratakan teks ke kiri.
              children: [
                Text(
                  title, // Menampilkan judul setiap poin artikel.
                  style: const TextStyle(
                    fontWeight: FontWeight.w600, // Menebalkan teks judul.
                    fontSize: 16, // Ukuran font judul.
                    color: Colors.white, // Warna teks putih.
                  ),
                ),
                const SizedBox(height: 4), // Memberi jarak antara judul dan deskripsi.
                Text(
                  description, // Menampilkan deskripsi untuk setiap poin artikel.
                  style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.white70), // Deskripsi dengan ukuran font lebih kecil.
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
