import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewModels/category_list_provider.dart';
import '../../viewModels/meal_list_provider.dart';
import '../meals_screen.dart';
import './meal_card.dart';
import './category_list.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryList = ref.watch(categoryListProvider);
    final mealList = ref.watch(mealListProvider);
    final randomMealList = ref.watch(randomMealListProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBar(
              hintText: 'Search',
              leading: Icon(Icons.search),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    textScaleFactor: 1.5,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_right_alt_rounded),
                  )
                ],
              ),
            ),
            CategoryList(categoryList: categoryList),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 40, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Meals',
                    textScaleFactor: 1.5,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_right_alt_rounded),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MealCard(meal: randomMealList[0]),
                  MealCard(meal: randomMealList[1])
                ],
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 40, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All Meals',
                    textScaleFactor: 1.5,
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                        splashFactory: NoSplash.splashFactory),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(MealsScreen.routeName),
                    icon: const Icon(Icons.arrow_right_alt_rounded),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MealCard(meal: mealList[2]),
                  MealCard(meal: mealList[3])
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MealCard(meal: mealList[4]),
                  MealCard(meal: mealList[5])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
