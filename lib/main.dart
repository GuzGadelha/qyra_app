import 'package:flutter/material.dart';
import 'package:qyra_app/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}