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
        title: Text('Sahabat Screen'),
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Your content here
              Padding(
                padding: const EdgeInsets.all(8.0), // Padding 2x2
                child: Text('Artikel 1: Informasi penting tentang Sahabat.'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0), // Padding 2x2
                child: Text('Artikel 2: Tips dan trik untuk menggunakan Sahabat.'),
              ),
              // ... existing content ...
            ],
          ),
        ),
      ),
    );
  }
}


