import 'package:flutter/material.dart'; // Mengimpor paket Flutter Material Design untuk menggunakan widget dan fitur UI.
import 'menu.dart'; // Mengimpor file 'menu.dart', yang kemungkinan berisi halaman MenuPage.

void main() { 
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()), 
    // Menjalankan aplikasi Flutter dengan widget MaterialApp sebagai root widget. 
    // debugShowCheckedModeBanner: false akan menyembunyikan banner debug di aplikasi.
    // Halaman pertama yang ditampilkan adalah SplashScreen.
  );
}

class SplashScreen extends StatefulWidget { 
  const SplashScreen({super.key}); // Konstruktor SplashScreen, menggunakan super.key untuk kunci widget.

  @override
  State<SplashScreen> createState() => _SplashScreenState(); 
  // Menciptakan state untuk SplashScreen dengan return _SplashScreenState.
}

class _SplashScreenState extends State<SplashScreen> { 
  final TextEditingController _nameController = TextEditingController(); 
  // Membuat controller untuk TextField yang akan digunakan untuk mengambil input dari pengguna.

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; 
    // Mengambil ukuran layar perangkat, yang berguna untuk menyesuaikan elemen UI berdasarkan ukuran layar.

    return Scaffold(
      backgroundColor: const Color(0xFF1E3A8A), 
      // Menetapkan warna latar belakang layar menjadi biru.
      body: SafeArea( 
        // Membungkus widget body dengan SafeArea untuk memastikan konten tidak tertutup dengan status bar.
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24), 
            // Menambahkan padding horizontal untuk konten agar tidak menempel di sisi layar.
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, 
              // Mengatur elemen-elemen di dalam Column agar berada di tengah vertikal.
              children: [
                SizedBox(height: 100), 
                // Menambahkan jarak atas sebesar 100px.
                Image.asset(
                  'assets/logo.png', 
                  height: size.height * 0.35, 
                  fit: BoxFit.contain, 
                  // Menampilkan logo aplikasi dengan ukuran tinggi 35% dari tinggi layar.
                  // Gambar akan diperkecil agar sesuai dengan ukuran yang tersedia.
                ),
                const Spacer(), 
                // Memberikan jarak kosong di antara elemen-elemen berikutnya (menggeser ke bawah).
                SizedBox(
                  width: 300, 
                  height: 50, 
                  // Menetapkan lebar dan tinggi untuk TextField.
                  child: TextField(
                    controller: _nameController, 
                    style: const TextStyle(color: Colors.white), 
                    // Menghubungkan TextField dengan _nameController dan menetapkan warna teks menjadi putih.
                    decoration: InputDecoration(
                      hintText: 'Masukkan Nama Anda', 
                      hintStyle: const TextStyle(color: Colors.white70), 
                      // Menambahkan hint text 'Masukkan Nama Anda' yang akan muncul saat TextField kosong.
                      filled: true, 
                      fillColor: Colors.white10, 
                      // Mengatur latar belakang TextField menjadi semi-transparan.
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12), 
                        borderSide: BorderSide.none, 
                        // Membuat border TextField dengan sudut melengkung dan tanpa garis tepi.
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      // Menambahkan padding di dalam TextField untuk memberi ruang di sekitarnya.
                    ),
                  ),
                ),
                const SizedBox(height: 25), 
                // Memberikan jarak vertikal antara TextField dan tombol di bawahnya.
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white, 
                    foregroundColor: const Color(0xFF1E3A8A), 
                    padding: const EdgeInsets.symmetric(
                      horizontal: 48, 
                      vertical: 14, 
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    String name = _nameController.text.trim(); 
                    // Mengambil nama yang dimasukkan oleh pengguna dan menghapus spasi tambahan.
                    if (name.isNotEmpty) { 
                      // Jika nama tidak kosong, lanjutkan ke halaman MenuPage.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuPage(name: name), 
                          // Menavigasi ke MenuPage dan mengirim nama pengguna ke halaman tersebut.
                        ),
                      );
                    } else { 
                      // Jika nama kosong, tampilkan SnackBar dengan pesan error.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Harap masukkan nama anda'),
                          backgroundColor: Colors.redAccent, 
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Mulai', 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 200), 
                // Memberikan jarak bawah untuk elemen slogan.
                Text(
                  '"Learn Smarter, Not Harder"', 
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white70, 
                    fontStyle: FontStyle.italic, 
                    // Menampilkan slogan dengan gaya font italic dan warna putih semi-transparan.
                  ),
                  textAlign: TextAlign.center, 
                  // Menyelaraskan teks agar berada di tengah.
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
