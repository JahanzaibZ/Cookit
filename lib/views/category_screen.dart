import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewModels/category_list_provider.dart';

class CategoryScreen extends ConsumerWidget {
  static const routeName = '/category-screen';

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryList = ref.watch(categoryListProvider);
    final categoryListNotifier = ref.read(categoryListProvider.notifier);
    categoryListNotifier.fectchCategoryList();
    return Scaffold(
      body: categoryListNotifier.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) => Card(
                child: FadeInImage(
                  placeholder: const AssetImage(
                      'assets/images/category_placeholder.jpg'),
                  image: NetworkImage(categoryList[index].thumbnailURL),
                ),
              ),
            ),
    );
  }
}
