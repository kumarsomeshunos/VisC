import 'dart:typed_data';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Function(String, {String type}) loadAndProcessImage;
  final List<Uint8List> images;
  final bool isProcessing;
  final TextEditingController urlController;

  const HomeScreen({super.key, 
    required this.loadAndProcessImage,
    required this.images,
    required this.isProcessing,
    required this.urlController,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Image Edge Detection',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Enter an image URL below and choose an edge detection method to process the image.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: widget.urlController,
            decoration: InputDecoration(
              labelText: 'Image URL',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            keyboardType: TextInputType.url,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (widget.urlController.text.isNotEmpty) {
                    widget.loadAndProcessImage(widget.urlController.text,
                        type: "Canny");
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Canny Edge'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (widget.urlController.text.isNotEmpty) {
                    widget.loadAndProcessImage(widget.urlController.text,
                        type: "Sobel");
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Sobel Edge'),
              ),
            ],
          ),
          const SizedBox(height: 30),
          widget.isProcessing
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : widget.images.isEmpty
                  ? Center(
                      child: Text(
                        'No image processed yet.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView(
                        children: [
                          const Text(
                            'Original Image',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.memory(
                              widget.images[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Processed Image',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.memory(
                              widget.images[1],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
        ],
      ),
    );
  }
}
