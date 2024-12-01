import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'screens/about_screen.dart';
import 'screens/home_screen.dart';
import 'utils/process_image.dart';

class EdgeDetectorApp extends StatefulWidget {
  const EdgeDetectorApp({super.key});

  @override
  _EdgeDetectorAppState createState() => _EdgeDetectorAppState();
}

class _EdgeDetectorAppState extends State<EdgeDetectorApp> {
  int _selectedIndex = 0;
  List<Uint8List> images = [];
  final TextEditingController _urlController = TextEditingController();
  bool _isProcessing = false;

  Future<void> _loadAndProcessImage(String url, {String type = "Canny"}) async {
    setState(() {
      _isProcessing = true;
    });
    try {
      final result = await processImageFromUrl(url, type: type);
      setState(() {
        images = result;
      });
    } catch (e) {
      print("Error in _loadAndProcessImage: $e");
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'VisC',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: _selectedIndex == 0
          ? HomeScreen(
              loadAndProcessImage: _loadAndProcessImage,
              images: images,
              isProcessing: _isProcessing,
              urlController: _urlController,
            )
          : const AboutScreen(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EdgeDetectorApp(),
  ));
}
