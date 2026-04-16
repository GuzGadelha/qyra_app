import 'package:flutter/material.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'package:qyra_app/views/shared/guide_card.dart';

/// A horizontal scrollable section that displays educational guides.
/// Uses a [ListView.separated] to render [GuideCard] widgets from mock data.
class GuideCarouselSection extends StatelessWidget {
  final VoidCallback onCardTap;

  const GuideCarouselSection({
    super.key,
    required this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {

    // Mock data
    final guides = [
      "Os segredos da nutrição consciente: Comer melhor, não menos",
      "As melhores técnicas para melhorar a qualidade do seu sono",
      "Como manter a constância nos treinos diários"
    ];

    return SizedBox(
      height: 250,
      child: ListView.separated(

        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: guides.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),

        itemBuilder: (context, index) {
          return GuideCard(
            imagePath: 'assets/images/guide_$index.png',
            title: guides[index],
            onTap: onCardTap,
          );
        },

      ),
    );
  }
}