import 'package:flutter/material.dart';

ThemeData appTheme({bool isDark = false}) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal,
      brightness: isDark ? Brightness.dark : Brightness.light,
    ),
  );
}
