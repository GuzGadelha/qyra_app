import 'package:flutter/material.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'package:qyra_app/core/constants/app_spacing.dart';
import 'package:qyra_app/views/pages/login_page.dart';
import 'package:qyra_app/views/pages/register_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyra_app/views/shared/white_button.dart';
import '../shared/purple_button.dart';

/// Initial landing screen for unauthenticated users.
/// Displays the app's value proposition and provides navigation paths
/// to either create a new account or log in to an existing one.
class RegisterOrLoginPage extends StatefulWidget {
  const RegisterOrLoginPage({super.key});

  @override
  State<RegisterOrLoginPage> createState() => _RegisterOrLoginPageState();
}

class _RegisterOrLoginPageState extends State<RegisterOrLoginPage> {
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

                  const SizedBox(height: AppSpacing.l),

                  //  Top logo
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/logo_qyra_vertical.svg',
                      height: 120, // adjusted for the vertical logo
                    ),
                  ),

                  const SizedBox(height: 60),

                  //  Title
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