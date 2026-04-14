import 'package:flutter/material.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'package:qyra_app/core/constants/app_spacing.dart';

class WelcomeVideoCard extends StatelessWidget {
  final VoidCallback onWatchVideo;
  final VoidCallback onClose;

  const WelcomeVideoCard({
    super.key,
    required this.onWatchVideo,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
      child: Container(
        width: double.infinity,
        // Top Background
        decoration: BoxDecoration(
          color: AppColors.lavender,
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            // Background Arch
            Positioned.fill(
              child: ClipPath(
                clipper: _ArchClipper(),
                child: Container(
                  color: AppColors.darkPurple,
                ),
              ),
            ),

            // Card Content
            Padding(
              padding: const EdgeInsets.only(
                top: 105,
                left: 20,
                right: 20,
                bottom: 24,
              ),
              child: Column(
                children: [
                  // Title
                  const Text(
                    "Você sabe tudo o que a QYRA\npode fazer por você?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Subtitle
                  const Text(
                    "Entenda como funciona seu programa para\nemagrecer e como acelerar seus resultados.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Time Indicator
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.access_time, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text("< 3 min", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Action Button
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: onWatchVideo,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.darkPurple,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Assistir vídeo",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Floating Avatar
            Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Container(
                width: 72, // Total diameter (radius * 2)
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.darkPurple, // The border color
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(3), // Border width
                child: Container(
                  // The inner circular holding the image
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      //  Doctor photo asset
                      image: AssetImage('assets/images/avatar.png'),
                    ),
                  ),
                ),
              ),
            ),

            // Close Button
            Positioned(
              top: 15,
              right: 15,
              child: GestureDetector(
                onTap: onClose,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 14,
                  child: Icon(Icons.close, size: 16, color: Colors.black87),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Clipper for the Arch background
class _ArchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 110);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 110);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}