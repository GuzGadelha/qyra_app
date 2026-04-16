import 'package:flutter/material.dart';
import 'package:qyra_app/core/constants/app_colors.dart';

/// A card widget that displays an image, a title, and a "Ver mais" action.
/// Commonly used within the [GuideCarouselSection] to show educational content.
class GuideCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const GuideCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    // Guide Card Container
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 260,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2DBE4), width: 1),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Top image area
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),

              child: Container(
                height: 120,
                width: double.infinity,
                color: const Color(0xFF88A59E),
              ),
            ),

            // Bottom text area
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryPurple,
                        height: 1.3,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const Spacer(),

                    // Action button
                    Row(
                      children: [
                        Text(
                          "Ver mais",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),

                        // Space
                        const SizedBox(width: 4),

                        // Arrow icon
                        Icon(
                          Icons.arrow_forward,
                          size: 16,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}