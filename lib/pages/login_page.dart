import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyra_app/auth/auth_service.dart';
import 'package:qyra_app/pages/register_page.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'package:qyra_app/core/constants/app_spacing.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // get auth service
  final authService = AuthService();
  // text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // variable for obscure password
  bool _obscurePassword = true;
  // variable for password or email error
  bool _hasError = false;
  // Colors
  final Color primaryPurple = const Color(0xFF5A4B69);
  final Color secondaryPeach = const Color(0xFFD6B5A7);

  // login button pressed
  void login() async {
    // prepare data
    final email = _emailController.text;
    final password = _passwordController.text;
    // attempt login...
    try {
      setState(() {
        // clean incorrect data entries
        _hasError = false;
      });
      await authService.signInWithEmailPassword(email, password);
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
      backgroundColor: Colors.white,
      //
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
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
              Container(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                    'assets/images/logo_qyra.svg',
                    height: AppSpacing.m,
                    fit: BoxFit.contain,
                  ),
              ),
              // space
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
                  hintText: "Digite seu e-mail",
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
                  hintText: "Digite a sua senha",
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
                  // hide password icon
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: (){
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
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
              // space
              const SizedBox(height: AppSpacing.lps),
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
                onPressed: () {
                  //  Navigator to register page
                  Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => const RegisterPage(),)
                  );
                },
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