import 'package:flutter/material.dart';

class SahabatScreen extends StatefulWidget {
  const SahabatScreen({super.key});

  @override
  State<SahabatScreen> createState() => _SahabatScreenState();
}

class _SahabatScreenState extends State<SahabatScreen> {
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan Makanan'),
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10, // Ganti dengan jumlah makanan yang sesuai
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column( // Changed to Column to include more details
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Makanan ${index + 1}: Deskripsi makanan ${index + 1}.'),
                        Text('Harga: \$${(index + 1) * 5}', // Example price
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


