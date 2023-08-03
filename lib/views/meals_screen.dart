import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewModels/meal_list_provider.dart';
import '../viewModels/filtered_meal_list_provider.dart';
import './widgets.dart/meal_card.dart';

class MealsScreen extends ConsumerWidget {
  static const routeName = '/meals-screen';

  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var mealsList = ref.watch(mealListProvider);
    final categoryStr = ModalRoute.of(context)!.settings.arguments as String?;
    if (categoryStr != null) {
      mealsList = ref.watch(categoryFilterMealListProvider);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryStr ?? 'All Meals'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .85,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 25),
          itemCount: mealsList.length,
          itemBuilder: (context, index) {
            return MealCard(meal: mealsList[index]);
          },
        ),
      ),
    );
  }
}
