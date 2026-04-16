import 'package:flutter/material.dart';
import 'package:qyra_app/core/constants/app_colors.dart';

/// A section that displays the user's most recent physical data.
/// It includes cards for weight and body index with trends and timestamps.
class LatestMeasurementsSection extends StatelessWidget {
  const LatestMeasurementsSection({super.key});

  @override
  Widget build(BuildContext context) {

    // main section layout
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Section title
        const Text(
          "Últimas medições",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),

        const SizedBox(height: 16),

        // measurements Card
        _buildWeightCard(),

        const SizedBox(height: 12),

        // Body index Card
        _buildBodyIndexCard(),
      ],
    );
  }

  /// Builds a card specifically for weight tracking.
  Widget _buildWeightCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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

          // header
          _buildCardHeader(Icons.directions_run, "Seu peso", "Fev 2025"),

          const SizedBox(height: 16),

          // main weight value
          RichText(
            text: const TextSpan(
              text: '78',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryPurple,
                height: 1.0,
              ),
              children: [
                TextSpan(
                  text: 'kg',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Informational Footer
          Row(
            children: [
              const Icon(Icons.info_outline, size: 16, color: AppColors.primaryPurple),
              const SizedBox(width: 8),
              Text(
                "Baseado no seu último registro",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primaryPurple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds a card for body composition indices.
  Widget _buildBodyIndexCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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

          // Header
          _buildCardHeader(Icons.accessibility_new, "Índice corporal", "Fev 2025"),

          const SizedBox(height: 16),

          // Card body content
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // Evolution trends
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTrendItem(Icons.trending_up, "+1.5kg de massa muscular"),
                    const SizedBox(height: 8),
                    _buildTrendItem(Icons.trending_down, "- 2kg de gordura"),
                  ],
                ),
              ),

              // Placeholder for graph
              Container(
                  width: 100,
                  height: 40,
                  alignment: Alignment.center,
                  child: Icon(Icons.auto_graph_sharp)
                ),
            ],
          ),
        ],
      ),
    );
  }

  /// Helper method to build a consistent header for measurement cards.
  Widget _buildCardHeader(IconData icon, String title, String date) {
    return Row(
      children: [

        Icon(icon, color: AppColors.primaryPurple, size: 20),

        const SizedBox(width: 8),

        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryPurple,
          ),
        ),

        const Spacer(), // Push the date over to the right.

        Text(
          date,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.primaryPurple,
          ),
        ),

        const Icon(Icons.chevron_right, color: AppColors.primaryPurple, size: 20),
      ],
    );
  }

  /// Helper method to build a trend indicator line.
  Widget _buildTrendItem(IconData icon, String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: AppColors.primaryPurple,
            borderRadius: BorderRadius.circular(20),
          ),

          child: Icon(icon, color: Colors.white, size: 12), // white arrow
        ),

        const SizedBox(width: 8),

        Expanded( // Prevents text from breaking the screen if it's too large.
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.primaryPurple,
            ),
          ),
        ),
      ],
    );
  }
}