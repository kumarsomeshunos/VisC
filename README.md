# **VisC: Advanced Computer Vision Application**

VisC is a mobile application developed to demonstrate edge detection techniques in computer vision. Built using **Flutter** and **OpenCV**, the app allows users to process images in real-time by entering image URLs and selecting one of the available edge detection methods: **Canny** or **Sobel**. 

The project bridges theoretical concepts with practical implementation, making it an ideal resource for learning and showcasing advanced computer vision techniques.

---

## **Features**

- **Canny Edge Detection**: Detects edges in an image while reducing noise.
- **Sobel Edge Detection**: Highlights edges using first-order derivatives.
- **Real-Time Processing**: Processes images fetched from user-provided URLs.
- **Minimalistic UI**: Clean and professional design with rounded image displays.
- **Easy Navigation**: Bottom navigation bar for toggling between Home and About sections.

---

## **Technology Stack**

- **Flutter**: Cross-platform framework for building the user interface.
- **OpenCV**: Powerful image processing library for edge detection.
- **Dart**: Programming language for Flutter applications.
- **HTTP**: To fetch images from user-provided URLs.

---

## **How It Works**

1. **Enter an Image URL**: On the Home screen, input the URL of the image you want to process.
2. **Select an Edge Detection Method**:
   - **Canny**: Detects edges with minimal noise.
   - **Sobel**: Highlights edges using gradients.
3. **View Processed Image**: The app displays the original and processed images with a sleek design.
4. **About Section**: Provides project details, objectives, and developer credits.

---

## **Installation**

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/VisC.git
   ```

2.	Navigate to the project directory:
```bash
cd VisC
```

3.	Install dependencies:
```bash
flutter pub get
```

4.	Run the app:
```bash
flutter run
```

--- 

## **Project Structure**
```
lib/
├── main.dart               # Entry point of the application
├── screens/
│   ├── home_screen.dart    # Home screen implementation
│   ├── about_screen.dart   # About screen implementation
├── utils/
│   ├── process_image.dart  # Image processing logic
assets/
├── screenshots/            # Screenshots of the app
```

## **Future Enhancements**

	•	Add more edge detection techniques like Laplacian.
	•	Support image uploads directly from the device.
	•	Enable saving and sharing processed images.
	•	Add real-time camera feed processing.

## **Credits**

	•	Course: Advanced Computer Vision (IT4143)
	•	Instructor: Dr. Pratistha Mathur
	•	Submitted By: Somesh Kumar
	•	Registration Number: 219302289
	•	Institution: Manipal University Jaipur

## **License**

This project is licensed under the MIT License.
