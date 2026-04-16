import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';

/// A secondary action button with an outlined style.
/// Typically used for alternative paths, cancellation, or less emphasized actions.
class WhiteButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const WhiteButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    // Outlined Button Component
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.secondaryPeach,

        // vertical padding
        padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.s
        ),

        // Border Side and Color
        side: const BorderSide(
            color: AppColors.secondaryPeach
        ),

        // Shape and Border Radius
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // Button Label
      child: Text(
          text,
          style: const TextStyle(
              fontSize: 16
          ),
      ),
    );
  }
}
