import 'package:flutter/material.dart';
import 'package:qyra_app/auth/auth_service.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'package:qyra_app/core/constants/app_spacing.dart';
import 'package:qyra_app/pages/login_page.dart';
import 'package:qyra_app/pages/register_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyra_app/shared/white_button.dart';

import '../shared/purple_button.dart';

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
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.m,
                  vertical: AppSpacing.l
              ),

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

                  //  space
                  const SizedBox(height: 60),

                  //  title
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

                  //  space
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

                // space
                const SizedBox(height: AppSpacing.rlps),

                // create account button
                  PurpleButton(
                    text: "Criar uma conta",
                    onPressed: () {
                      Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const RegisterPage())
                      );
                    },
                  ),

                  //  space
                  const SizedBox(height: AppSpacing.s),
                      
                  // login button
                  WhiteButton(
                      text: "Entrar na minha conta", 
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                            ),
                        );
                      },
                  ),

                ],
              ),
            ),
        ),
    );
  }
}