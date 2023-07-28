import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';
import '../services/api_service.dart';

final mealListLoading = StateProvider<bool>(
  (ref) => false,
);

final mealListError = StateProvider<String?>(
  (ref) => null,
);

final mealListProvider = StateNotifierProvider<MealListNotifier, List<Meal>>(
    (ref) => MealListNotifier(ref));

class MealListNotifier extends StateNotifier<List<Meal>> {
  var _isInit = true;
  final Ref _ref;
  MealListNotifier(this._ref) : super([]);

  Future<void> fetchMealList({again = false}) async {
    if (_isInit || again) {
      var isLoading = _ref.read(mealListLoading.notifier);
      var error = _ref.read(mealListError.notifier);
      try {
        isLoading.state = true;
        final mealList = await ApiService.fetchAllMealsFromAPI();
        state = mealList;
        error.state =
            null; // In case if user is trying again after encountring error
        isLoading.state = false;
        _isInit = false;
      } catch (e) {
        error.state = e.toString();
        isLoading.state = false;
        _isInit = false;
      }
    }
  }
}
