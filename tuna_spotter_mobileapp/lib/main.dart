import 'package:flutter/material.dart';
import 'secondscren.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/background1.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Dark overlay
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // Welcome text
          const Positioned(
            left: 38,
            top: 170,
            child: Text(
              "Welcome to",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Title
          const Positioned(
            left: 38,
            top: 211,
            child: Text(
              "Tuna Spotter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Description
          const Positioned(
            left: 42,
            top: 311,
            right: 42,
            child: Text(
              'Ready to Scan?\n\n'
              'Point your camera or upload a photo '
              'to identify tuna species, view nutrition '
              'info and check freshness with confidence',
              style: TextStyle(
                color: Color(0xFFE0E0E0),
                fontSize: 16,
              ),
            ),
          ),

          // ✅ CENTERED Get Started Button
          Positioned(
            top: 738,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 280,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectionScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF003D55),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
