import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/category-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cookit',
          textScaleFactor: 1.5,
        ),
      ),
    );
  }
}
