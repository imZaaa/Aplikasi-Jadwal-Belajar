import 'package:flutter/material.dart';  // Mengimpor pustaka Flutter Material untuk komponen UI.
import 'jadwal.dart';  // Mengimpor file 'jadwal.dart', mungkin untuk halaman lain dalam aplikasi.

void main() {
  runApp(  // Fungsi utama untuk menjalankan aplikasi Flutter.
    const MaterialApp(  // Membuat instance aplikasi berbasis Material Design.
      debugShowCheckedModeBanner: false,  // Menonaktifkan banner debug di sudut kanan atas.
      home: Input(name: '', showWelcome: true),  // Menetapkan halaman awal aplikasi sebagai Input.
    ),
  );
}

List<Map<String, String>> jadwalList = [];  // Mendeklarasikan list untuk menyimpan jadwal yang dimasukkan.

class Input extends StatefulWidget {  // Membuat widget Input yang merupakan StatefulWidget.
  final String name;  // Parameter untuk nama pengguna.
  final bool showWelcome;  // Parameter untuk menunjukkan pesan sambutan.
  const Input({super.key, required this.name, required this.showWelcome});  // Konstruktor untuk menerima parameter name dan showWelcome.

  @override
  State<Input> createState() => _InputState();  // Mengembalikan state untuk widget Input.
}

class _InputState extends State<Input> {  // State untuk widget Input.
  final _formKey = GlobalKey<FormState>();  // GlobalKey untuk mengidentifikasi form.
  final TextEditingController mapelController = TextEditingController();  // Kontroler untuk input mata pelajaran.
  final TextEditingController durasiController = TextEditingController();  // Kontroler untuk input durasi belajar.
  final TextEditingController catatanController = TextEditingController();  // Kontroler untuk input catatan.
  final TextEditingController tanggalController = TextEditingController();  // Kontroler untuk input tanggal.

  @override
  void dispose() {  // Metode untuk membersihkan sumber daya setelah widget tidak digunakan.
    mapelController.dispose();
    durasiController.dispose();
    catatanController.dispose();
    tanggalController.dispose();
    super.dispose();  // Memanggil dispose dari superclass.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // Menyediakan struktur dasar halaman dengan appBar dan body.
      body: Container(  // Membungkus UI dengan container yang memiliki gradient background.
        decoration: const BoxDecoration(
          gradient: LinearGradient(  // Membuat efek gradient dari biru ke warna yang lebih terang.
            colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(  // Menyediakan area aman untuk tampilan.
          child: Padding(  // Memberikan padding di sekitar konten.
            padding: const EdgeInsets.all(24.0),
            child: Column(  // Mengatur konten secara vertikal.
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(  // Baris untuk header dengan ikon dan teks.
                  children: [
                    GestureDetector(  // Membuat tombol untuk kembali ke halaman sebelumnya.
                      onTap: () {
                        Navigator.pop(context);  // Menavigasi kembali ke halaman sebelumnya.
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,  // Ikon panah untuk kembali.
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),  // Memberikan jarak antar elemen.
                    const Text(
                      'Study Master',  // Judul aplikasi.
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),  // Menyebarkan ruang kosong.
                    const Icon(
                      Icons.menu_book,  // Ikon buku.
                      color: Colors.yellowAccent,
                      size: 28,
                    ),
                  ],
                ),
                const SizedBox(height: 30),  // Memberikan jarak setelah header.

                // Menampilkan teks sambutan.
                Text(
                  'Hello, ${widget.name}!',  // Menampilkan nama pengguna.
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 16),  // Memberikan jarak antar elemen.

                Text(
                  'Buat jadwal belajar mu!!!',  // Menampilkan instruksi.
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),  // Memberikan jarak antar elemen.

                // Form untuk memasukkan jadwal.
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 8),
                      ),
                    ],
                    border: Border.all(
                      color: const Color(0xFF1E3A8A),
                      width: 2,
                    ),
                  ),
                  child: Form(  // Membungkus form input untuk validasi.
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomInputField(  // Input untuk Mata Pelajaran
                          label: 'Mata Pelajaran / Kuliah',
                          controller: mapelController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Mata pelajaran tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),  // Memberikan jarak antar elemen input.
                        CustomInputField(  // Input untuk Durasi Belajar
                          label: 'Durasi Belajar',
                          controller: durasiController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Durasi belajar tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),  // Memberikan jarak antar elemen input.
                        CustomInputField(  // Input untuk Catatan
                          label: 'Catatan',
                          controller: catatanController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Catatan tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 12),  // Memberikan jarak antar elemen input.
                        CustomInputField(  // Input untuk Tanggal
                          label: 'Tanggal',
                          controller: tanggalController,
                          isDate: true,  // Menandakan input ini adalah tanggal.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tanggal tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(),  // Memberikan ruang kosong di bawah form.

                // Tombol untuk menyimpan jadwal.
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 20,
                  ),
                  child: SizedBox(
                    width: double.infinity,  // Menentukan tombol mengambil lebar penuh.
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E3A8A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {  // Memeriksa apakah form valid.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JadwalPage(  // Menavigasi ke halaman JadwalPage setelah form berhasil.
                                name: widget.name,
                                mapel: mapelController.text,
                                durasi: durasiController.text,
                                catatan: catatanController.text,
                                tanggal: tanggalController.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Simpan Jadwal',  // Teks tombol
                        style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {  // Membuat widget input form kustom untuk validasi.
  final String label;  // Label untuk input field.
  final bool isDate;  // Menandakan apakah input ini berupa tanggal.
  final TextEditingController controller;  // Kontroler untuk input field.
  final String? Function(String?)? validator;  // Fungsi validator untuk memeriksa input.

  const CustomInputField({
    super.key,
    required this.label,
    this.isDate = false,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        fontFamily: 'Times New Roman',
        fontSize: 16,
        fontStyle: FontStyle.italic,
      ),
      decoration: InputDecoration(
        labelText: label,  // Menampilkan label di dalam input.
        labelStyle: const TextStyle(
          fontFamily: 'Times New Roman',
          fontSize: 16,
          fontStyle: FontStyle.italic,
          color: Colors.black,
        ),
        suffixIcon: isDate
            ? const Icon(  // Menambahkan ikon kalender jika input adalah tanggal.
                Icons.calendar_today,
                color: Colors.blueAccent,
                size: 20,
              )
            : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black87, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
      readOnly: isDate,  // Menjadikan field hanya baca jika input adalah tanggal.
      validator: validator,  // Menambahkan fungsi validasi.
      onTap: () async {
        if (isDate) {  // Jika input adalah tanggal, tampilkan picker tanggal.
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
          );

          if (pickedDate != null) {
            String formattedDate =
                "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";  // Format tanggal yang dipilih.
            controller.text = formattedDate;  // Set tanggal yang dipilih ke controller.
          }
        }
      },
    );
  }
}