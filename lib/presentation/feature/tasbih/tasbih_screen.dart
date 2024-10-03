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

  void incrementCounter() {
    setState(() {
      if (counter >= 33) {
        counter = 1; // Reset to 1 if counter reaches 33
        randomText = (texts..shuffle()).first; // Change to a random text
      } else {
        counter++;
      }
    });
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
      backgroundColor: Colors.green[100], // Mengatur warna background
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tasbih Digital"), // Ganti judul
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
                    fontSize: (Theme.of(context).textTheme.headlineLarge?.fontSize ?? 20) + 2, // Increase font size by 2
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),
                const SizedBox(height: 16), // Add spacing between the title and counter
                Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center, // Center the text
                ),
                const SizedBox(height: 16), // Add spacing below the counter
                Text(
                  randomText, // Display the random text
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontStyle: FontStyle.italic), // Make text italic
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
            ),
          ),
        ],
      ),
    );
  }
}
