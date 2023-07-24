import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';
import '../services/api_service.dart';

final mealListProvider = StateNotifierProvider<MealListNotifier, List<Meal>>(
    (ref) => MealListNotifier());

class MealListNotifier extends StateNotifier<List<Meal>> {
  MealListNotifier() : super([]);

  Future<void> fetchMealList() async {
    final mealList = await ApiService.fetchAllMealsFromAPI();
    state = mealList;
  }
}
