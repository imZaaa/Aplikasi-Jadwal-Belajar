import 'package:flutter/material.dart';  // Mengimpor paket Material Design untuk penggunaan widget seperti Scaffold, Icon, dan lainnya.
import 'input.dart';  // Mengimpor halaman Input untuk input data jadwal.
import 'package:intl/intl.dart';  // Mengimpor library intl untuk format tanggal.
import 'artikel.dart';  // Mengimpor halaman Artikel.

class JadwalPage extends StatefulWidget {
  final String name;  // Nama pengguna yang diterima dari halaman sebelumnya.
  final String mapel;  // Mata pelajaran jadwal yang diterima.
  final String durasi;  // Durasi waktu mata pelajaran.
  final String catatan;  // Catatan tambahan.
  final String tanggal;  // Tanggal jadwal.

  const JadwalPage({
    super.key,
    required this.name,
    required this.mapel,
    required this.durasi,
    required this.catatan,
    required this.tanggal,
  });

  @override
  JadwalPageState createState() => JadwalPageState();  // Membuat dan mengembalikan state dari halaman ini.
}

class JadwalPageState extends State<JadwalPage> {
  List<Map<String, String>> jadwalList = [];  // Menyimpan data jadwal dalam bentuk list map.

  @override
  void initState() {
    super.initState();  // Memanggil metode initState dari kelas induk.
    addJadwal();  // Menambahkan jadwal ke dalam daftar saat halaman pertama kali dimuat.
  }

  void addJadwal() {
    // Memeriksa apakah semua informasi yang dibutuhkan telah diisi.
    if (widget.mapel.isNotEmpty &&
        widget.durasi.isNotEmpty &&
        widget.catatan.isNotEmpty &&
        widget.tanggal.isNotEmpty) {
      setState(() {
        jadwalList.add({
          'mapel': widget.mapel,
          'durasi': widget.durasi,
          'catatan': widget.catatan,
          'tanggal': widget.tanggal,
        });
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Jadwal berhasil ditambahkan'),  // Menampilkan pesan jika jadwal berhasil ditambahkan.
            backgroundColor: Color(0xFF1E3A8A),
          ),
        );
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Belum ada jadwal yang ditambahkan!'),  // Pesan jika ada informasi yang belum diisi.
            backgroundColor: Colors.red,
          ),
        );
      });
    }
  }

  void deleteJadwal(int index) {
    setState(() {
      jadwalList.removeAt(index);  // Menghapus jadwal berdasarkan index yang dipilih.
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Jadwal berhasil dihapus'),  // Menampilkan pesan jika jadwal berhasil dihapus.
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],  // Membuat gradasi warna latar belakang.
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);  // Tombol untuk kembali ke halaman sebelumnya.
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,  // Ikon untuk kembali.
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Study Master',  // Judul halaman.
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.menu_book,  // Ikon buku di bagian kanan header.
                      color: Colors.yellowAccent,
                      size: 28,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Greeting Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, ${widget.name}!',  // Menyapa pengguna dengan nama yang diterima.
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Berikut jadwal belajarmu...',  // Teks penjelasan jadwal.
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.lightbulb,  // Ikon untuk menuju ke halaman artikel.
                        color: Colors.yellowAccent,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ArticlePage(),  // Navigasi ke halaman artikel.
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const Divider(height: 30, thickness: 1, color: Colors.white30),

              // ListView
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: jadwalList.length,  // Jumlah item yang akan ditampilkan.
                  itemBuilder: (context, index) {
                    var jadwal = jadwalList[index];  // Mengambil data jadwal sesuai dengan index.
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Isi utama
                          Padding(
                            padding: const EdgeInsets.only(right: 48),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.menu_book_outlined,  // Ikon untuk mata pelajaran.
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        jadwal['mapel'] ?? '',  // Nama mata pelajaran.
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.alarm,  // Ikon untuk durasi.
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(jadwal['durasi'] ?? ''),  // Durasi pelajaran.
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Catatan:',  // Judul untuk catatan.
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  jadwal['catatan'] ?? '',  // Catatan mata pelajaran.
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          // Tanggal
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1E3A8A),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                formatTanggal(jadwal['tanggal'] ?? ''),  // Menampilkan tanggal dalam format yang sesuai.
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // Tombol hapus
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),  // Tombol untuk menghapus jadwal.
                              onPressed: () {
                                confirmDelete(index);  // Memanggil konfirmasi penghapusan jadwal.
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1E3A8A),
        onPressed: () async {
          final result = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(
              builder: (_) => Input(name: widget.name, showWelcome: false),  // Navigasi ke halaman Input.
            ),
          );
          if (result != null) {
            setState(() {
              jadwalList.add(result);  // Menambahkan hasil input jadwal ke dalam list.
            });
          }
        },
        child: const Icon(Icons.add, color: Colors.white),  // Ikon untuk tombol tambah jadwal.
      ),
    );
  }

  void confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Hapus Jadwal"),
          content: const Text("Apakah Anda yakin ingin menghapus jadwal ini?"),  // Konfirmasi penghapusan.
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog jika batal.
              },
              child: const Text("Batal", style: TextStyle(color: Colors.grey)),
            ),
            TextButton(
              onPressed: () {
                deleteJadwal(index);  // Menghapus jadwal jika tombol Hapus ditekan.
                Navigator.of(context).pop();  // Tutup dialog setelah menghapus.
              },
              child: const Text("Hapus", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  String formatTanggal(String tanggal) {
    try {
      DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(tanggal);  // Parsing tanggal yang diterima.
      return DateFormat('d MMMM yyyy', 'id_ID').format(parsedDate);  // Format tanggal dalam format Indonesia.
    } catch (e) {
      return tanggal;  // Jika terjadi error, kembalikan tanggal asli.
    }
  }
}