import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme({bool isDark = false}) {
  return ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.ubuntuTextTheme().apply(
      bodyColor: isDark ? Colors.white.withAlpha(220) : null,
      displayColor: isDark ? Colors.white.withAlpha(220) : null,
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
        brightness: isDark ? Brightness.dark : Brightness.light),
  );
}
