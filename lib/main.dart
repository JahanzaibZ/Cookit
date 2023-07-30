import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './utils/app_theme.dart';
import 'views/main_screen.dart';
// import './views/category_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      darkTheme: appTheme(isDark: true),
      title: "Cookit",
      home: const MainScreen(),
    );
  }
}
