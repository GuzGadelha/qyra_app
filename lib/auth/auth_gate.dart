/* 
Auth Gate - this will continuosly listen for auth state changes
- unauthenticated = Login Page
- authenticated = Profile Page
*/

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../pages/login_page.dart';

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
          return const Scaffold(
            body: Center(
              child: Text("Tela Home em construção..."),
            ),
          );
        } else {
          // Retorna a página de login se não houver sessão
          return const LoginPage();
        }

      }
    );
  }

}

class ProfilePage {
}