import 'package:flutter/material.dart';

class Tema{
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.cyanAccent,
    appBarTheme: const AppBarTheme(
      elevation: 20
    )
  );
}