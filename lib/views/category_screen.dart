import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewModels/category_list_provider.dart';

class CategoryScreen extends ConsumerWidget {
  static const routeName = '/category-screen';

  const CategoryScreen({super.key});

  Widget scaffoldBody(WidgetRef ref) {
    final categoryList = ref.watch(categoryListProvider);
    final isLoading = ref.watch(categoryListLoading);
    final error = ref.watch(categoryListError);
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (error != null) {
      return SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                error,
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              onPressed: () => ref
                  .read(categoryListProvider.notifier)
                  .fetchCategoryList(again: true),
              child: const Text('Try Again'),
            )
          ],
        ),
      );
    } else {
      return GridView.builder(
        itemCount: categoryList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Card(
          child: FadeInImage(
            placeholder:
                const AssetImage('assets/images/category_placeholder.jpg'),
            image: NetworkImage(categoryList[index].thumbnailURL),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(
      Duration.zero,
      () => ref.read(categoryListProvider.notifier).fetchCategoryList(),
    );
    return Scaffold(
      body: scaffoldBody(ref),
    );
  }
}
