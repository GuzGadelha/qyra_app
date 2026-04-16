import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qyra_app/auth/auth_service.dart';
import 'package:qyra_app/views/pages/home_page.dart';
import 'package:qyra_app/views/pages/register_page.dart';
import 'package:qyra_app/core/constants/app_colors.dart';
import 'package:qyra_app/core/constants/app_spacing.dart';
import 'package:qyra_app/views/shared/purple_button.dart';
import 'package:qyra_app/views/shared/white_button.dart';


/// Screen responsible for existing user authentication.
/// Collects credentials and interacts with the [AuthService] to log the user in.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();  // get auth service
  final _emailController = TextEditingController();   // text controllers
  final _passwordController = TextEditingController();

  bool _obscurePassword = true; // variable for obscure password
  bool _hasError = false; // variable for password or email error

  /// Attempts to authenticate the user via Supabase.
  /// Navigates to [HomePage] on success, or displays an error state on failure.
  void login() async {
    // prepare data
    final email = _emailController.text;
    final password = _passwordController.text;

    // attempt login...
    try {
      setState(() {
        _hasError = false;  // clean incorrect data entries
      });

      //  waiting supabase authentication
      await authService.signInWithEmailPassword(email, password);

      //  If it reaches here means that login was successful!
      //  Now, navigate to the home page
      if (mounted) {
        Navigator.pushReplacement(
            context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }

    } catch (e) {
      setState(() {
        _hasError = true; // show's error message
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

              //  login button
              PurpleButton(
                  text: "Entrar na minha conta",
                  onPressed: login,
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
              WhiteButton(
                  text: "Criar uma conta",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegisterPage(),)
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