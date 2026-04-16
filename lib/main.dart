import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth/auth_gate.dart';

void main() async {
  //  supabase setup
  await Supabase.initialize(
    anonKey: "sb_publishable_-pbIHHZoklScS4QRdrZaIQ_gvtdAGl-",
    url: "https://unduuzvgumkzecmsbxez.supabase.co",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Qyra App",
      debugShowCheckedModeBanner: false,

      //  App font
      theme: ThemeData(
        textTheme: GoogleFonts.manropeTextTheme(
          Theme.of(context).textTheme,
        ),
      ),

      //  App start
      home: AuthGate(),
    );
  }
}