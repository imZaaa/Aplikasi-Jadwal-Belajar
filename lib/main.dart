import 'package:flutter/material.dart'; // Mengimpor paket Flutter Material Design untuk menggunakan widget dan fitur UI.
import 'home.dart'; // Mengimpor file 'home.dart', yang kemungkinan berisi widget seperti SplashScreen.

void main() { 
  runApp(MyApp()); // Menjalankan aplikasi Flutter dengan widget MyApp sebagai root widget.
}

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) { 
    return MaterialApp( // Membuat aplikasi berbasis Material Design.
      title: 'Study Master', // Menetapkan judul aplikasi yang akan ditampilkan di taskbar atau launcher.
      initialRoute: '/', // Menetapkan rute awal aplikasi yang akan dijalankan pertama kali, dalam hal ini adalah '/'. 
      routes: { // Mendefinisikan rute aplikasi yang akan digunakan untuk navigasi.
        '/': (context) => SplashScreen(), // Rute '/' akan memuat SplashScreen saat aplikasi dijalankan pertama kali.
      },
    );
  }
}
