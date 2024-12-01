import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'About This Application',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'This application is a practical demonstration of theoretical concepts studied in the Advanced Computer Vision course (Course Code: IT4143), primarily focusing on Edge Detection techniques.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Course Details:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('- Course Name: Advanced Computer Vision',
                    style: TextStyle(fontSize: 16)),
                Text('- Instructor: Dr. Pratistha Mathur',
                    style: TextStyle(fontSize: 16)),
                Text('- Semester: VII', style: TextStyle(fontSize: 16)),
                SizedBox(height: 20),
                Text(
                  'Submitted By:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('- Name: Somesh Kumar', style: TextStyle(fontSize: 16)),
                Text('- Registration Number: 219302289',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
