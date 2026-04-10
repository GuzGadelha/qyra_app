import 'package:flutter/material.dart';
import 'package:qyra_app/auth/auth_service.dart';

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

  // login button pressed
  void login() async {
    // prepare data
    final email = _emailController.text;
    final password = _passwordController.text;

    // attempt login...
    try {
      await authService.signInWithEmailPassword(email, password);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Error: $e"),),
        );
      }
    }
  }


  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}