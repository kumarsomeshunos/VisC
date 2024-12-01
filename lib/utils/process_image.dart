import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:opencv_dart/opencv.dart' as cv;

/// Function to process the image: fetch from URL, apply grayscale, and edge detection.
Future<List<Uint8List>> processImageFromUrl(String imageUrl,
    {String type = "Canny"}) async {
  try {
    // Fetch the image from the URL
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode != 200) {
      throw Exception("Failed to load image from URL: $imageUrl");
    }

    final imageBytes = response.bodyBytes;

    // Decode image to OpenCV Mat format
    final mat = cv.imdecode(imageBytes, cv.IMREAD_COLOR);
    print("Original Image: width: ${mat.cols}, height: ${mat.rows}");

    // Convert to grayscale
    final gray = await cv.cvtColorAsync(mat, cv.COLOR_BGR2GRAY);

    cv.Mat processedMat;

    if (type == "Canny") {
      // Apply Canny Edge Detection
      processedMat = await cv.cannyAsync(gray, 100, 200);
    } else if (type == "Sobel") {
      // Apply Sobel Edge Detection
      processedMat = await cv.sobelAsync(
        gray, // Source Mat
        3, // ddepth: Signed 16-bit integer (CV_16S)
        1, // dx: Derivative order in X direction
        0, // dy: Derivative order in Y direction
        ksize: 3, // Size of the kernel
        scale: 1, // Scaling factor
        delta: 0, // Delta added to the results
        borderType: cv.BORDER_DEFAULT, // Border type
      );
    } else {
      throw Exception("Unsupported processing type: $type");
    }

    // Convert images back to Uint8List for display
    final List<Uint8List> result = [
      cv.imencode(".png", mat).$2, // Original image
      cv.imencode(".png", processedMat).$2 // Processed image
    ];

    // Dispose intermediate Mat objects
    mat.dispose();
    gray.dispose();
    processedMat.dispose();

    return result;
  } catch (e) {
    print("Error in processImageFromUrl: $e");
    rethrow;
  }
}
