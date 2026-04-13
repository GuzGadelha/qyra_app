import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'package:qyra_app/core/constants/app_spacing.dart';

import 'home_page.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //  Container with top image
            Container(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                'assets/images/success_illustration.svg',
                height: 340,
              ),
            ),

            // Container for text
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacing.s,
              ),
              // column for both texts be align in center
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //  Big text
                  const Text(
                        'A sua conta foi criada com sucesso!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                  //  space
                  const SizedBox(height: AppSpacing.s),
                  //  sub text
                  const Text(
                        'Agora é só seguir para a próxima etapa!✨',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textPrimary,
                        ),
                      ),
                ],
              ),
            ),
            //  space
            const SizedBox(height: AppSpacing.sps),
            // continue button
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: ElevatedButton(
                onPressed: home,
                //  button style
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryPurple,
                  foregroundColor: Colors.white,

                  // internal padding
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.s,
                  ),

                  //  rounded corners
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),

                // button text
                child: const Text(
                  "Continuar",
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.m),

          ],
        ),
      ),
    );
  }
}
