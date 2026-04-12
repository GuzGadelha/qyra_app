/* 
Auth Gate - this will continuosly listen for auth state changes
- unauthenticated = Login Page
- authenticated = Profile Page
*/

import 'package:flutter/material.dart';
import 'package:qyra_app/pages/register_or_login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../core/constants/app_spacing.dart';
import '../pages/login_page.dart';
import '../pages/register_or_login_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context){
    return StreamBuilder(
      // Listen to auth state changes
      stream: Supabase.instance.client.auth.onAuthStateChange,  
      
      // build appropriate page based on auth state
      builder: (context, snapshot) {
        // loading... screen
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        
        // check if there is a valid session currently
        final session = snapshot.hasData ? snapshot.data!.session : null;

        if (session != null) {
          // Retorna uma tela temporária caso o usuário já esteja logado
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Tela Home em construção..."),
                  //
                  const SizedBox(height: AppSpacing.m),
                  //
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    ),  
                    onPressed: () async {
                      await Supabase.instance.client.auth.signOut();
                    }, 
                    child: const Text("Sair da conta"),
                  ),
                ],
              ),
            ),
          );
        } else {
          // Retorna a página de login se não houver sessão
          return const RegisterOrLoginPage();
        }

      }
    );
  }

}

class ProfilePage {
}