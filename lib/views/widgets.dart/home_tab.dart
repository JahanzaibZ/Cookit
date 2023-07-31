import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewModels/category_list_provider.dart';
import '../../viewModels/meal_list_provider.dart';
import './meal_card.dart';

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
            SizedBox(
              height: 75,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.brightness ==
                              Brightness.light
                          ? const Color.fromARGB(255, 240, 240, 240)
                          : const Color.fromARGB(255, 50, 50, 50),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    child: Center(
                      child: FittedBox(
                        child: Text(categoryList[index].name),
                      ),
                    ),
                  );
                },
              ),
            ),
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
                  MealTile(meal: randomMealList[0]),
                  MealTile(meal: randomMealList[1])
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
                  MealTile(meal: mealList[2]),
                  MealTile(meal: mealList[3])
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MealTile(meal: mealList[4]),
                  MealTile(meal: mealList[5])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
