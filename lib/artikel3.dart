import 'package:flutter/material.dart';  // Mengimpor paket Flutter untuk akses ke widget dan fitur UI.

class Article3Page extends StatelessWidget {
  const Article3Page({super.key});  // Konstruktor untuk halaman ini, dengan key opsional untuk widget.

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // Scaffold adalah struktur dasar untuk halaman Flutter yang menyediakan berbagai elemen seperti AppBar, Drawer, dll.
      body: Container(  // Container digunakan untuk menampung semua elemen halaman.
        decoration: const BoxDecoration(  // Dekorasi untuk memberikan latar belakang dengan gradient.
          gradient: LinearGradient(  // Menentukan gradient warna latar belakang.
            colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],  // Warna gradient dari biru tua ke biru cerah.
            begin: Alignment.topCenter,  // Gradient dimulai dari bagian atas.
            end: Alignment.bottomCenter,  // Gradient berakhir di bagian bawah.
          ),
        ),
        child: SafeArea(  // SafeArea memastikan konten tidak tertutup oleh area sistem (seperti notch di ponsel).
          child: Column(  // Column digunakan untuk menampilkan elemen-elemen secara vertikal.
            children: [
              Padding(  // Padding memberi jarak antara konten dan tepi layar.
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),  // Padding horisontal 20 dan vertikal 22.
                child: Row(  // Row menata elemen-elemen secara horizontal.
                  children: [
                    GestureDetector(  // GestureDetector memungkinkan interaksi seperti tap.
                      onTap: () => Navigator.pop(context),  // Ketika tap, akan kembali ke halaman sebelumnya.
                      child: const Icon(Icons.arrow_back_ios, color: Colors.white),  // Ikon panah untuk kembali.
                    ),
                    const SizedBox(width: 14),  // Memberikan jarak antara elemen.
                    const Text(
                      'Study Master',  // Judul aplikasi.
                      style: TextStyle(
                        color: Colors.white,  // Warna teks putih.
                        fontSize: 22,  // Ukuran font 22.
                        fontWeight: FontWeight.bold,  // Font bold.
                      ),
                    ),
                    const Spacer(),  // Spacer membuat ruang kosong di tengah untuk menggeser elemen ke kanan.
                    const Icon(Icons.menu_book_rounded, color: Colors.yellowAccent, size: 28),  // Ikon buku menu.
                  ],
                ),
              ),
              Expanded(  // Expanded memastikan bagian ini mengisi ruang yang tersisa.
                child: SingleChildScrollView(  // SingleChildScrollView memungkinkan konten untuk digulir jika melebihi layar.
                  padding: const EdgeInsets.all(20),  // Memberikan padding di sekitar konten.
                  child: Column(  // Column menata elemen-elemen secara vertikal.
                    crossAxisAlignment: CrossAxisAlignment.start,  // Menyusun elemen dimulai dari sisi kiri.
                    children: [
                      const Text(
                        'Aplikasi Wajib untuk Bantu Kamu Lebih Produktif Setiap Hari',  // Judul artikel.
                        style: TextStyle(
                          fontSize: 22,  // Ukuran font 22.
                          fontWeight: FontWeight.bold,  // Font bold.
                          color: Colors.white,  // Warna teks putih.
                        ),
                      ),
                      const SizedBox(height: 8),  // Memberikan jarak antar elemen.
                      Row(  // Menata elemen secara horizontal.
                        children: const [
                          Icon(Icons.access_time, size: 16, color: Colors.white70),  // Ikon waktu.
                          SizedBox(width: 6),  // Memberikan jarak antar elemen.
                          Text(
                            '5 menit baca',  // Durasi baca artikel.
                            style: TextStyle(color: Colors.white70, fontSize: 14),  // Warna dan ukuran teks.
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),  // Memberikan jarak antar elemen.
                      const Text(
                        'Di era digital ini, ada banyak aplikasi yang dapat membantu kamu menjadi lebih produktif setiap harinya...',
                        style: TextStyle(fontSize: 16, height: 1.6, color: Colors.white),  // Deskripsi artikel.
                      ),
                      const SizedBox(height: 16),  // Memberikan jarak antar elemen.
                      // Daftar aplikasi yang bisa membantu produktivitas.
                      const _ArticlePoint(number: '1', title: 'Trello', description: 'Trello adalah aplikasi manajemen tugas...'),
                      const _ArticlePoint(number: '2', title: 'Google Calendar', description: 'Google Calendar memudahkan kamu untuk mengatur jadwal...'),
                      const _ArticlePoint(number: '3', title: 'Notion', description: 'Notion adalah aplikasi all-in-one untuk mencatat...'),
                      const _ArticlePoint(number: '4', title: 'Forest', description: 'Forest membantu kamu untuk fokus dengan menumbuhkan pohon virtual...'),
                      const _ArticlePoint(number: '5', title: 'Evernote', description: 'Evernote adalah aplikasi catatan yang memungkinkan kamu untuk menulis...'),
                      const SizedBox(height: 24),  // Memberikan jarak antar elemen.
                      const Text(
                        'Dengan menggunakan aplikasi-aplikasi di atas, kamu dapat mengelola waktu dengan lebih baik...',
                        style: TextStyle(fontSize: 16, height: 1.6, color: Colors.white),  // Penutupan artikel.
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

// Widget untuk menampilkan setiap poin artikel dengan nomor, judul, dan deskripsi.
class _ArticlePoint extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const _ArticlePoint({
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),  // Padding bawah untuk setiap poin.
      child: Row(  // Row menata elemen secara horizontal.
        crossAxisAlignment: CrossAxisAlignment.start,  // Menyusun elemen dimulai dari atas.
        children: [
          CircleAvatar(  // Membuat lingkaran untuk nomor.
            radius: 14,  // Ukuran radius lingkaran.
            backgroundColor: const Color(0xFF1A3F8B),  // Warna latar lingkaran.
            child: Text(
              number,  // Menampilkan nomor artikel.
              style: const TextStyle(color: Colors.white, fontSize: 14),  // Warna teks putih dan ukuran font 14.
            ),
          ),
          const SizedBox(width: 12),  // Memberikan jarak antar elemen.
          Expanded(  // Expanded memastikan kolom ini mengisi sisa ruang.
            child: Column(  // Column menata elemen secara vertikal.
              crossAxisAlignment: CrossAxisAlignment.start,  // Menyusun elemen dimulai dari kiri.
              children: [
                Text(
                  title,  // Menampilkan judul artikel.
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,  // Font semi-bold.
                    fontSize: 16,  // Ukuran font 16.
                    color: Colors.white,  // Warna teks putih.
                  ),
                ),
                const SizedBox(height: 4),  // Memberikan jarak antar elemen.
                Text(
                  description,  // Menampilkan deskripsi artikel.
                  style: const TextStyle(fontSize: 15, height: 1.5, color: Colors.white70),  // Gaya teks untuk deskripsi.
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}