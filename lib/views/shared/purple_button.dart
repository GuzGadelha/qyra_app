import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';

/// The primary action button used throughout the application.
/// Styled with the brand's primary purple color and standard rounded corners.
class PurpleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PurpleButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    // Elevated Button Component
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,

        //  vertical padding
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.s,
        ),

        // shape and border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),

      // button label
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16
        ),
      ),
    );
  }
}
