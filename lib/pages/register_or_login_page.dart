import 'package:flutter/material.dart';
import 'package:qyra_app/auth/auth_service.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'package:qyra_app/core/constants/app_spacing.dart';
import 'package:qyra_app/pages/login_page.dart';
import 'package:qyra_app/pages/register_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterOrLoginPage extends StatefulWidget {
  const RegisterOrLoginPage({super.key});

  @override
  State<RegisterOrLoginPage> createState() => _RegisterOrLoginPageState();
}

class _RegisterOrLoginPageState extends State<RegisterOrLoginPage> {
  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
              //
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.m,
                  vertical: AppSpacing.l
              ),
              //
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //  logo
                  const SizedBox(height: AppSpacing.l), // top spacing
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/logo_qyra_vertical.svg',
                      height: 120, // adjusted for the vertical logo
                    ),
                  ),
                  //
                const SizedBox(height: 60),
                // Title
                const Text(
                  "A mudança que você procura\ncomeça aqui!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.primaryPurple,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: AppSpacing.m),

                // Subtitle
                const Text(
                  "Facilite sua jornada de emagrecimento com\ntecnologia e especialistas sempre por perto.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),

                // temporary spacing - adjust this value to push buttons down
                const SizedBox(height: AppSpacing.rlps),

                // create account button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()
                        ),
                    );
                  },
                  // button style
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.s),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                      "Criar uma conta",
                      style: TextStyle(fontSize: 16)
                  ),
                ),
                      const SizedBox(height: AppSpacing.s),

                      // login button
                      OutlinedButton(
                        onPressed: () {
                          // navigate to login page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()
                            ),
                          );
                        },
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
                        child: const Text(
                            "Entrar na minha conta",
                            style: TextStyle(fontSize: 16)
                        ),
                      ),
                    ],
                ),
            ),
        ),
    );
  }
}