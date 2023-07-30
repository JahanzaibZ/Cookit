import 'package:flutter/material.dart';

class FavoritesTab extends StatelessWidget {
  final MediaQueryData mediaQuery;

  const FavoritesTab(this.mediaQuery, {super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldBodyHeight = mediaQuery.size.height -
        mediaQuery.padding.vertical -
        kToolbarHeight -
        kBottomNavigationBarHeight;
    debugPrint(
        'Favorite Tab, Scaffold Body Height: $scaffoldBodyHeight, Device Height: ${mediaQuery.size.height}, Padding Vertical: ${mediaQuery.padding.vertical}, Toolbar Height: $kToolbarHeight, Bottom Bar Height: $kBottomNavigationBarHeight'); // Added for debugging
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      height: scaffoldBodyHeight,
      child: const Column(
        children: [
          Text(
            'Favorites',
            textScaleFactor: 1.5,
          ),
        ],
      ),
    );
  }
}
