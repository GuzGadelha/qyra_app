import 'package:flutter/material.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'action_text_button.dart';

/// A versatile card widget designed to display specific tasks or notifications.
/// Features a leading image and a content area with a title, subtitle, and action button.
class TaskCard extends StatelessWidget {
  final String imagePath; // Image asset path
  final String title;
  final String subtitle;
  final String actionText;
  final VoidCallback onActionTap;
  final Color backgroundColor; // Card background color
  final Color actionTextColor; // Action button/text color

  const TaskCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.actionText,
    required this.onActionTap,
    required this.backgroundColor,
    required this.actionTextColor,
  });

  @override
  Widget build(BuildContext context) {

    // Main Card Container
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Leading Image Area
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 90,
              height: 90,
              color: Colors.white.withAlpha(1000),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Content Area
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Task title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primaryPurple,
                    height: 1.1,
                  ),
                ),

                const SizedBox(height: 8),

                // Task subtitle
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.textSecondary,
                    height: 1.1,
                  ),
                ),

                const SizedBox(height: 8),

                // Action Link
                ActionTextButton(
                  text: actionText,
                  onPressed: onActionTap,
                ),

                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}