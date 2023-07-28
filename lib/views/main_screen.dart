import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewModels/category_list_provider.dart';
import '../viewModels/meal_list_provider.dart';
import './widgets.dart/home_tab.dart';
import './widgets.dart/favorites_tab.dart';

class MainScreen extends ConsumerStatefulWidget {
  static const routeName = '/category-screen';

  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        ref.read(categoryListProvider.notifier).fetchCategoryList();
        ref.read(mealListProvider.notifier).fetchMealList();
      },
    );
    super.initState();
  }

  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cookit',
          textScaleFactor: 1.5,
        ),
      ),
      body: currentIndex == 0 ? const HomeTab() : const FavoritesTab(),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (value) => setState(() => currentIndex = value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favorites',
            ),
          ]),
    );
  }
}
