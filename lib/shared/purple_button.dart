import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_spacing.dart';

class PurpleButton extends StatelessWidget {
  //  parameters to make a new purple button
  //  button text and function
  final String text;
  final VoidCallback onPressed;

  const PurpleButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //  Uses the function passed as a parameter
      onPressed: onPressed,
      //  button style
      style: ElevatedButton.styleFrom(
        //  colors
        backgroundColor: AppColors.primaryPurple,
        foregroundColor: Colors.white,
        //  inside padding
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.s,
        ),
        // shape
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),
      // button text
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 16
        ),
      ),
    );
  }
}
