import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pegadaian_digital/data/pegadaian_preferences.dart';
import 'package:pegadaian_digital/injection.dart';

class TasbihScreen extends StatefulWidget { // Ganti HomeScreen dengan TasbihScreen
  const TasbihScreen({super.key}); // Ganti constructor

  @override
  State<TasbihScreen> createState() => _TasbihScreenState(); // Ganti State
}

class _TasbihScreenState extends State<TasbihScreen> { // Ganti State class
  int counter = 0;
  String randomText = 'Allahu Akbar الله أكبر Allah Maha Besar'; // Initial random text
  final List<String> texts = [
  'Allahu Akbar الله أكبر Allah Maha Besar',
  'Astagfirullah أستغفر الله Aku memohon ampun kepada Allah',
  'Alhamdulillah الحمد لله Segala puji bagi Allah',
  'La ilaha illallah لا إله إلا الله Tiada Tuhan selain Allah',
  'Subhanallah سبحان الله Maha Suci Allah',
  'Hasbiyallah حسبي الله Cukuplah Allah bagiku',
  'La hawla wa la quwwata illa billah لا حول ولا قوة إلا بالله Tiada daya dan kekuatan kecuali dengan Allah',
  'Subhanallahi wa bihamdihi سبحان الله وبحمده Maha Suci Allah dan segala puji bagi-Nya',
  'Subhanallahil \'Azim سبحان الله العظيم Maha Suci Allah yang Maha Agung',
  'Bismillah بسم الله Dengan nama Allah',
  'Innalillahi wa inna ilaihi raji\'un إِنَّا لِلّهِ وَإِنَّـا إِلَيْهِ رَاجِعونَ Sesungguhnya kami milik Allah dan kepada-Nya kami kembali',
  'Allahumma salli \'ala Muhammad اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ Ya Allah, limpahkanlah shalawat atas Nabi Muhammad',
  'Raditu billahi rabba رَضِيتُ بِاللهِ رَبًّا Aku ridha Allah sebagai Tuhanku',
  'Ya Allah يا الله Wahai Allah',
  'La ilaha illa anta subhanaka inni kuntu minaz zalimin لَا إِلَهَ إِلَّا أَنتَ سُبْحَانَكَ إِنِّي كُنتُ مِنَ الظَّالِمِينَ Tidak ada Tuhan selain Engkau, Maha Suci Engkau, sesungguhnya aku termasuk orang yang zalim',
  'Alhamdulillahi rabbil \'alamin الحمد لله رب العالمين Segala puji bagi Allah, Tuhan seluruh alam',
  'Ya Hayyu Ya Qayyum يَا حَيُّ يَا قَيُّومُ Wahai Yang Maha Hidup, Yang Maha Berdiri Sendiri'
];

  double _opacity = 1.0; // Menyimpan nilai opacity

  void incrementCounter() {
    setState(() {
      counter++;
      if (counter > 33) { // Reset counter jika lebih dari 33
        counter = 1;
        randomText = getRandomString(); // Memperbarui randomText saat reset
      }
      _opacity = 0.0; // Mengatur opacity menjadi 0 untuk efek menyala
    });

    // Mengembalikan opacity setelah delay
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0; // Mengembalikan opacity ke 1
      });
    });
  }

  // Fungsi untuk mendapatkan string random
  String getRandomString() {
    // Ganti dengan logika untuk mendapatkan string random dari daftar
    List<String> strings = [
  'Allahu Akbar الله أكبر Allah Maha Besar',
  'Astagfirullah أستغفر الله Aku memohon ampun kepada Allah',
  'Alhamdulillah الحمد لله Segala puji bagi Allah',
  'La ilaha illallah لا إله إلا الله Tiada Tuhan selain Allah',
  'Subhanallah سبحان الله Maha Suci Allah',
  'Hasbiyallah حسبي الله Cukuplah Allah bagiku',
  'La hawla wa la quwwata illa billah لا حول ولا قوة إلا بالله Tiada daya dan kekuatan kecuali dengan Allah',
  'Subhanallahi wa bihamdihi سبحان الله وبحمده Maha Suci Allah dan segala puji bagi-Nya',
  'Subhanallahil \'Azim سبحان الله العظيم Maha Suci Allah yang Maha Agung',
  'Bismillah بسم الله Dengan nama Allah',
  'Innalillahi wa inna ilaihi raji\'un إِنَّا لِلّهِ وَإِنَّـا إِلَيْهِ رَاجِعونَ Sesungguhnya kami milik Allah dan kepada-Nya kami kembali',
  'Allahumma salli \'ala Muhammad اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ Ya Allah, limpahkanlah shalawat atas Nabi Muhammad',
  'Raditu billahi rabba رَضِيتُ بِاللهِ رَبًّا Aku ridha Allah sebagai Tuhanku',
  'Ya Allah يا الله Wahai Allah',
  'La ilaha illa anta subhanaka inni kuntu minaz zalimin لَا إِلَهَ إِلَّا أَنتَ سُبْحَانَكَ إِنِّي كُنتُ مِنَ الظَّالِمِينَ Tidak ada Tuhan selain Engkau, Maha Suci Engkau, sesungguhnya aku termasuk orang yang zalim',
  'Alhamdulillahi rabbil \'alamin الحمد لله رب العالمين Segala puji bagi Allah, Tuhan seluruh alam',
  'Ya Hayyu Ya Qayyum يَا حَيُّ يَا قَيُّومُ Wahai Yang Maha Hidup, Yang Maha Berdiri Sendiri'
]; // Contoh daftar string
    return (strings..shuffle()).first; // Mengacak dan mengambil string pertama
  }

  Future<void> initLocal() async {
    PegadaianPreferences pref = getIt.get<PegadaianPreferences>();
    bool isUserLoggedIn = pref.isUserLoggedIn();
    String token = pref.getUserToken() ?? "";
    Logger().d("HOMESCREEN $isUserLoggedIn || $token");
  }

  @override
  void initState() {
    initLocal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Mengatur warna latar belakang menjadi putih
      appBar: AppBar(
        backgroundColor: Colors.white, // Mengubah warna header menjadi putih
        title: Text("Dzikir Digital", style: TextStyle(color: Colors.black)), // Mengubah warna teks judul menjadi hitam
        iconTheme: IconThemeData(color: Colors.green), // Mengubah warna tombol back menjadi hijau
      ),
      body: Stack( // Changed from Column to Stack
        children: [
          Center( // Center the entire column
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mulai Berdzikir',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold, // Make text bold
                    fontSize: (Theme.of(context).textTheme.headlineLarge?.fontSize ?? 20) + 4, // Increase font size by 4
                    color: Colors.black, // Change text color to black
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),
                const SizedBox(height: 16), // Add spacing between the title and counter
                AnimatedOpacity(
                  opacity: _opacity, // Menggunakan nilai opacity
                  duration: Duration(milliseconds: 300), // Durasi animasi
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green, // Warna latar belakang lingkaran
                      shape: BoxShape.circle, // Bentuk lingkaran
                    ),
                    padding: EdgeInsets.all(20), // Padding untuk memberi ruang di dalam lingkaran
                    child: Text(
                      '$counter',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white, // Mengubah warna teks menjadi putih
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center, // Center the text
                    ),
                  ),
                ),
                const SizedBox(height: 16), // Add spacing below the counter
                Text(
                  randomText, // Pastikan randomText tetap ada
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontStyle: FontStyle.italic, // Make text italic
                    color: Colors.black, // Change text color to black
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),
              ],
            ),
          ),
          Positioned( // Positioning the floating action button
            bottom: 16, // Position it 16 pixels from the bottom
            left: MediaQuery.of(context).size.width / 2 - 28, // Center horizontally
            child: FloatingActionButton(
              onPressed: incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
              backgroundColor: Colors.blueAccent, // Change background color to blue accent
              elevation: 5, // Increase elevation
            ),
          ),
        ],
      ),
    );
  }
}
