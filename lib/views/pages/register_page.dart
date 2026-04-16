import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qyra_app/auth/auth_service.dart';
import 'package:qyra_app/views/pages/sucess_page.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'package:qyra_app/core/constants/app_spacing.dart';
import 'package:qyra_app/views/shared/purple_button.dart';


/// Screen responsible for registering a new user account.
/// Captures email and password, validates them locally, and uses [AuthService]
/// to create a new user in Supabase before navigating to [SuccessPage].
class RegisterPage  extends StatefulWidget {
  const RegisterPage ({super.key});

  @override
  State<RegisterPage > createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage > {
  final authService = AuthService();  // get auth service

  final _emailController = TextEditingController();   // text controllers
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _emailAlreadyInUse = false;   // variable for dynamic error messages
  String? _errorMessage;

  /// Validates input fields and attempts to register the user via Supabase.
  /// Handles password mismatch and "email already in use" errors gracefully.
  void register() async {
    // prepare data
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    // attempt register...
    try {
      setState(() {
        _errorMessage = null;
        _emailAlreadyInUse = false;
      });

      // Local Validation: Password match
      if (password != confirmPassword) {
        setState(() {
          _errorMessage = "As senhas que você digitou não são iguais";
        });
        return;
      }

      // Supabase Registration
      final response = await authService.signUpWithEmailPassword(email, password);

      // Validation: Email already in use check
      if ((response.user != null) && (response.user!.identities != null) && (response.user!.identities!.isEmpty)) {
        setState(() {
          _emailAlreadyInUse = true;
        });
        return;
      }

      // Success Navigation
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const SuccessPage(),
          ),
        );
      }

    } catch (e) {
      setState(() {
        final errorText = e.toString().toLowerCase();   // Error handling and parsing

        // Specific check for existing user/email conflict
        if (errorText.contains("already registered") ||
            errorText.contains("user already exists") ||
            errorText.contains("já cadastrado") ||
            errorText.contains("already been registered")) {
          _emailAlreadyInUse = true;
          _errorMessage = null;
        } else {
          _emailAlreadyInUse = false;
          _errorMessage = null;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.m,
            vertical: AppSpacing.m,
          ),

          //  Content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // logo qyra
              Container(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  'assets/images/logo_qyra.svg',
                  height: 26,
                ),
              ),

              const SizedBox(height: AppSpacing.m),

              //  Header texts
              const Text(
                "Dados de login para sua conta",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight(500),
                ),
              ),

              const Text(
                  "Preencha os campos para criar a sua conta",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),

              const SizedBox(height: AppSpacing.m),

              // email field

              const Text(
                "E-mail",
                style: TextStyle(
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: AppSpacing.xs),

              // text field for e-mail
              TextField(
                controller: _emailController,  //  email controller

                //  input decoration
                decoration: InputDecoration(
                  hintText: "Informe aqui o seu e-mail",

                  //  text style
                  hintStyle: const TextStyle(
                    color: AppColors.textHint,
                  ),

                  //  internal padding
                  contentPadding:  const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s,
                    vertical: AppSpacing.s,
                  ),

                  //  default border
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.borderLight,
                    ),
                  ),

                  // border when not focused
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.borderLight,
                    ),
                  ),

                  //  border when focused
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primaryPurple,
                    ),
                  ),
                ),
              ),

              // email error message
              if (_emailAlreadyInUse) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  "Ops! Já existe uma conta com esse e-mail",
                  style: TextStyle(
                    color: AppColors.errorRed,
                    fontSize: 12,
                  ),
                ),
              ],

              const SizedBox(height: AppSpacing.m),

              // password field

              const Text(
                "Senha",
                style: TextStyle(
                    color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: AppSpacing.xs),

              // text field for password
              TextField(
                controller: _passwordController,  //  password controllers
                decoration: InputDecoration(      //  input decoration

                  //  placeholder text
                  hintText: "Crie uma senha para a sua conta",
                  hintStyle: const TextStyle(
                    color: AppColors.textHint,
                    fontWeight: FontWeight.bold,
                  ),

                  //  internal padding
                  contentPadding:  const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s,
                    vertical: AppSpacing.s,
                  ),

                  //  default border
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.borderLight,
                    ),
                  ),

                  //  border when not focused
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.borderLight,
                    ),
                  ),

                  //  border when focused
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primaryPurple,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.m),

              // confirm password field

              const Text(
                "Confirmar senha",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                  ),
              ),

              const SizedBox(height: AppSpacing.xs),

              // text field for confirm password
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  //  internalText text and decoration
                  hintText: "Digite novamente a senha cadastrada",
                  hintStyle: const TextStyle(
                    color: AppColors.textHint,
                    fontWeight: FontWeight.bold,
                  ),

                  //  internal padding
                  contentPadding:  const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s,
                    vertical: AppSpacing.s,
                  ),

                  //  default border
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.borderLight,
                    ),
                  ),

                  //  border when not focused
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.borderLight,
                    ),
                  ),

                  //  border when focused
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primaryPurple,
                    ),
                  ),
                ),
              ),

              // different passwords error message
              if (_errorMessage != null) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  _errorMessage!,
                  style: TextStyle(
                    color: AppColors.errorRed,
                    fontSize: 12,
                  ),
                ),
              ],

              const SizedBox(height: AppSpacing.rps),

              // continue button
              PurpleButton(
                text: "Continuar",
                onPressed: register,
              ),

            ],
          ),
        ),
      ),
    );
  }
}