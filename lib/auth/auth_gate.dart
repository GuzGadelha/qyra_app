import 'package:flutter/material.dart';
import 'package:qyra_app/views/pages/home_page.dart';
import 'package:qyra_app/views/pages/register_or_login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Acts as the main authentication router for the application.
/// It continuously listens to Supabase auth state changes and directs the user
/// to the [HomePage] if authenticated, or the [RegisterOrLoginPage] if not.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context){

    // Auth state stream listener (Now strongly typed with <AuthState>)
    return StreamBuilder<AuthState>(
      stream: Supabase.instance.client.auth.onAuthStateChange,  
      
      // loading state
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Check if there is a valid session currently
        final session = snapshot.hasData ? snapshot.data!.session : null;

        // Route based on session existence
        if (session != null) {
          return const HomePage();
        } else {
          return const RegisterOrLoginPage();
        }

      }
    );
  }

}