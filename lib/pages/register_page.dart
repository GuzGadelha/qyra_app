import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qyra_app/auth/auth_service.dart';
import 'package:qyra_app/pages/home_page.dart';
import 'package:qyra_app/pages/sucess_page.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'package:qyra_app/core/constants/app_spacing.dart';
import 'package:qyra_app/shared/purple_button.dart';

class RegisterPage  extends StatefulWidget {
  const RegisterPage ({super.key});

  @override
  State<RegisterPage > createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage > {
  // get auth service
  final authService = AuthService();

  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // variable for dynamic error messages
  bool _emailAlreadyInUse = false;
  String? _errorMessage;

  // register button pressed
  void register() async {
    // prepare data
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    // attempt register...
    try {
      setState(() {
        // clean incorrect data entries
        _errorMessage = null;
        _emailAlreadyInUse = false;
      });

      // check if passwords match BEFORE trying to register
      if (password != confirmPassword) {
        setState(() {
          _errorMessage = "As senhas que você digitou não são iguais";
        });
        return; // stop's execution here
      }

      //  Go´s to supabase and try to create a new user
      final response = await authService.signUpWithEmailPassword(email, password);

      //  checks if email is already in use
      if ((response.user != null) && (response.user!.identities != null) && (response.user!.identities!.isEmpty)) {
        setState(() {
          // email already exists
          _emailAlreadyInUse = true;
        });
        return; // stop's execution here
      }

      //  if everything's ok then go to success page
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
        //  error text
        final errorText = e.toString().toLowerCase();
        //  email already in use error
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

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar with arrow do go back
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),

      //  background color
      backgroundColor: Colors.white,

      //  screen content
      body: SafeArea(
        child: SingleChildScrollView(
          //  screen padding
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

              //  space
              const SizedBox(height: AppSpacing.m),

              //  Text over email
              const Text(
                "Dados de login para sua conta",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight(500),
                ),
              ),

              // sub text
              const Text(
                  "Preencha os campos para criar a sua conta",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),

              //  space
              const SizedBox(height: AppSpacing.m),

              // email
              // e-mail text above the field
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
                  hintText: "Informe aqui o seu e-mail",   //  placeholder text

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

              //  space
              const SizedBox(height: AppSpacing.m),

              // password
              // text above the field
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

              // space
              const SizedBox(height: AppSpacing.m),

              // confirm password
              // text above the field
              const Text(
                "Confirmar senha",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                  ),
              ),

              //  space
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

              // space
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