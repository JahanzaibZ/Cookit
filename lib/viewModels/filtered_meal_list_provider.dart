import 'package:cookit/viewModels/meal_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

final filteredMealListProvider =
    StateNotifierProvider<FilteredMealList, List<Meal>>(
        (ref) => FilteredMealList(ref));

class FilteredMealList extends StateNotifier<List<Meal>> {
  final Ref _ref;
  FilteredMealList(this._ref) : super([]);

  void filterMealListByCategory(String category) {
    final mealList = _ref.watch(mealListProvider);
    state = mealList.where((meal) => meal.category == category).toList();
  }
}
