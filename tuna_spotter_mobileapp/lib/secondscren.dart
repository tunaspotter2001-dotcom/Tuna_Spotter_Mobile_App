import 'package:flutter/material.dart';
import 'package:tuna_spotter_mobileapp/thirdscreen.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌈 Background Gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFF7995A0),
                  Color(0xFF003449),
                ],
                stops: [0.0, 0.45, 1.0],
              ),
            ),
          ),

          // 🐟 App Icon
          Positioned(
            top: 180,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 90,
                height: 90,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFFFCECEC),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      'assets/images/Logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 🏷 Title
          const Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Tuna Spotter",
                style: TextStyle(
                  color: Color(0xFF003D55),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // 📝 Subtitle
          const Positioned(
            top: 350,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "AI-Based Fish Detection",
                style: TextStyle(
                  color: Color(0xFF003D55),
                  fontSize: 20,
                ),
              ),
            ),
          ),

          // 🔵 PRIMARY BUTTON — Capture Using Camera
          Positioned(
            top: 571,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 280,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InstructionScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                  label: const Text(
                    "Capture Using Camera",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF003D55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 🔹 SECONDARY BUTTON — Upload from Gallery
          Positioned(
            top: 663,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 280,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InstructionScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.photo, color: Color(0xFF003D55)),
                  label: const Text(
                    "Upload from Gallery",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF003D55),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: const BorderSide(
                        color: Color(0xFF003D55),
                        width: 2,
                      ),
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

