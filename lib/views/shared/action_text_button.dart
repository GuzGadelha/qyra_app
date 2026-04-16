import 'package:flutter/material.dart';
import 'package:qyra_app/core/constants/app_colors.dart';

/// A compact text button used for secondary actions.
/// Designed with minimal padding and [MaterialTapTargetSize.shrinkWrap]
/// to fit tightly within layouts like cards or list items.
class ActionTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ActionTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    // Action Text Button
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryPurple,
        padding: EdgeInsets.all(5),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
      ),

      // Button Label
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColors.secondaryPeach,
        ),
      ),

    );
  }
}