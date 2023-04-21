import 'package:flutter/material.dart';
import 'package:httpcall/temas/tema.dart';
import 'package:httpcall/pantallas/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Tema().getTheme(),
      home: const HomeScreen(),
    );
  }
}

