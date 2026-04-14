import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_spacing.dart';

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
    return OutlinedButton(
      //  action
      onPressed: onPressed,
      // button style
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.secondaryPeach,
        padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.s
        ),
        side: const BorderSide(
            color: AppColors.secondaryPeach
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
          text,
          style: const TextStyle(
              fontSize: 16
          ),
      ),
    );
  }
}
