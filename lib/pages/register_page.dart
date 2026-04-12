import 'package:flutter/material.dart';
import 'package:qyra_app/auth/auth_service.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'package:qyra_app/core/constants/app_spacing.dart';

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
  // variable for obscure password
  bool _obscurePassword = true;
  // variable for password error
  bool _hasError = false;
  // Colors
  final Color primaryPurple = const Color(0xFF5A4B69);
  final Color secondaryPeach = const Color(0xFFD6B5A7);

  // login button pressed
  void login() async {
    // prepare data
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    // attempt register...
    try {
      setState(() {
        // clean incorrect data entries
        _hasError = false;
      });
      await authService.signUpWithEmailPassword(email, password);
    } catch (e) {
      setState(() {
        // show's error message
        _hasError = true;
      });
    }
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      //
      backgroundColor: Colors.white,
      //
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.m,
            vertical: AppSpacing.l,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // logo qyra
              const SizedBox(height: AppSpacing.l,),
                Center(
                child: Image.asset(
                  'assets/images/logo_qyra.svg',
                  height: 120,
                ),
              ),
              //
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
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Informe aqui o seu e-mail",
                  hintStyle: const TextStyle(
                    color: AppColors.textHint,
                  ),
                  contentPadding:  const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s,
                    vertical: AppSpacing.s,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.borderLight,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.borderLight,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primaryPurple,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.m),

              // password
              // password text above the field
              const Text(
                "Senha",
                style: TextStyle(
                    color: AppColors.textPrimary
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              // text field for password
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: "Crie uma senha para a sua conta",
                  hintStyle: const TextStyle(
                    color: AppColors.textHint,
                  ),

                  contentPadding:  const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s,
                    vertical: AppSpacing.s,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.borderLight,
                    ),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.borderLight,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primaryPurple,
                    ),
                  ),

                ),
              ),

              // error message
              if (_hasError) ...[
                const SizedBox(height: AppSpacing.xs),
                const Text(
                  "Ops! E-mail ou senha incorretos",
                  style: TextStyle(
                    color: AppColors.errorRed,
                    fontSize: 12,
                  ),
                ),
              ],




              // forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Esqueceu a sua senha?",
                    style: TextStyle(
                        color: AppColors.secondaryPeach,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),

              // terms of use text
              const Text(
                "Acessando a sua conta QYRA, você concorda com os nossos Termos de Uso e as nossas Políticas de Privacidade",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.s),

              // login button
              ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSpacing.s,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                // button text
                child: const Text(
                  "Entrar na minha conta",
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.l),

              // no account text
              const Text(
                "Ainda não possui uma conta? Crie uma agora mesmo",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary
                ),
              ),
              const SizedBox(height: AppSpacing.s),

              // create account button
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.secondaryPeach,
                  padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.s
                  ),
                  side: BorderSide(
                      color: AppColors.secondaryPeach
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                // button text
                child: const Text(
                    "Criar uma conta",
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