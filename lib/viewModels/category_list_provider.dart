import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/category.dart';
import '../services/api_service.dart';

final categoryListProvider =
    StateNotifierProvider<CategoryListNotifier, List<Category>>(
        (ref) => CategoryListNotifier());

class CategoryListNotifier extends StateNotifier<List<Category>> {
  CategoryListNotifier() : super([]);

  Future<void> fectchCategoryList() async {
    final categoryList = await ApiService.fetchAllCategoriesFromAPI();
    state = categoryList;
  }
}
