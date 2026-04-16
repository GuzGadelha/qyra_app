import 'package:flutter/material.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';

/// A dashboard section that displays the user's current "Q-Points" progress.
/// Uses a [RichText] widget to highlight the numerical evolution within a stylized card.
class QPointsSection extends StatelessWidget {
  final int currentPoints;

  const QPointsSection({
    super.key,
    required this.currentPoints,
  });

  @override
  Widget build(BuildContext context) {

    // Q-Points Section Layout
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Section Title
        const Text(
          "Q-pontos",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),

        const SizedBox(height: AppSpacing.s,),

        // Evolution status Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 18,
          ),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(350),
                blurRadius: 5,
                offset: const Offset(-2, 2),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Card header
              const Text(
                "Sua evolução",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryPurple,
                ),
              ),



              // Dynamic Points Progress Display
              RichText(
                text: TextSpan(
                  text: '$currentPoints',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryPurple,
                    height: 1.1,
                  ),

                  children: const [
                    TextSpan(
                      text: ' de 100',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Engagement Description
              const Text(
                "Visualize o seu perfil atual de saúde e acompanhe a sua evolução durante a nossa jornada",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}