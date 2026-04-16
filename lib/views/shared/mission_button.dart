import 'package:flutter/material.dart';
import 'package:qyra_app/core/constants/app_colors.dart';

/// A custom outlined button designed for daily missions.
/// Features a leading icon, a flexible title, and a trailing arrow.
class MissionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MissionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    // Mission Button style
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 16),

        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryPurple,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        side: const BorderSide(
          color: Color(0xFFE2DBE4),
          width: 1,
        ),
      ),

      // button content
      child: Row(
        children: [

          // Left side icon
          Icon(icon, color: AppColors.primaryPurple),

          const SizedBox(width: 16),

          // Center content
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryPurple,
              ),
            ),
          ),

          // Right side arrow
          const Icon(Icons.arrow_forward, color: AppColors.primaryPurple, size: 20),
        ],
      ),
    );
  }
}