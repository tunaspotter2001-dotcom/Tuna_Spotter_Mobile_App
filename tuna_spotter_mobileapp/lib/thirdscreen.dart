import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InstructionScreen extends StatefulWidget {
  const InstructionScreen({super.key});

  @override
  State<InstructionScreen> createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  // 🔧 CONTROL VALUES
  static const double titleSubtitleSpacing = 10;
  static const double instructionBoxPadding = 18;
  static const double instructionIconRadius = 24;

  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;

  // 📸 OPEN CAMERA
  Future<void> _openCamera() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  // 🖼 OPEN GALLERY
  Future<void> _openGallery() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6E6E6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE6E6E6),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Instruction',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: SizedBox(
          height: 1000,
          child: Stack(
            children: [

              // 🐠 Top Image Card (Preview selected image if available)
              Positioned(
                top: 20,
                left: 16,
                right: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: _selectedImage != null
                            ? Image.file(
                                _selectedImage!,
                                height: 230,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/images/testimg.jpg',
                                height: 230,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'For best detection accuracy',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: titleSubtitleSpacing),
                            Text(
                              'Follow these guidelines to ensure our AI can correctly identify the fish species',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 📌 Instruction Boxes
              _fixedTile(
                top: 390,
                icon: Icons.center_focus_strong,
                iconBg: const Color(0xFFE6F4EA),
                iconColor: Colors.green,
                title: 'Show full fish clearly',
                subtitle: 'Ensure the head and tail are visible.',
              ),
              _fixedTile(
                top: 485,
                icon: Icons.lightbulb_outline,
                iconBg: const Color(0xFFFFF4E5),
                iconColor: Colors.orange,
                title: 'Use good lighting',
                subtitle: 'Avoid shadows covering the fish.',
              ),
              _fixedTile(
                top: 580,
                icon: Icons.phone_android,
                iconBg: const Color(0xFFE8F0FE),
                iconColor: Colors.blue,
                title: 'Hold phone steady',
                subtitle: 'Blurry images reduce accuracy.',
              ),
              _fixedTile(
                top: 675,
                icon: Icons.warning_amber_rounded,
                iconBg: const Color(0xFFF3E8FF),
                iconColor: Colors.purple,
                title: 'Avoid angled photos',
                subtitle: 'Fish shape may appear distorted.',
              ),

              // 🔵 PRIMARY BUTTON — Continue to Capture
              Positioned(
                top: 810,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    width: 280,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _openCamera,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF003D55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Continue to Capture',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // 🔹 SECONDARY BUTTON — Continue to Upload
              Positioned(
                top: 875,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    width: 280,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _openGallery,
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
                      child: const Text(
                        'Continue to Upload',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF003D55),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 📌 Instruction Tile
  static Widget _fixedTile({
    required double top,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Positioned(
      top: top,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.all(instructionBoxPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: instructionIconRadius,
              backgroundColor: iconBg,
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
