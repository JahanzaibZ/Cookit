import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewModels/category_list_provider.dart';
import '../../viewModels/meal_list_provider.dart';

class HomeTab extends ConsumerWidget {
  final MediaQueryData mediaQuery;

  const HomeTab(this.mediaQuery, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldBodyHeight = mediaQuery.size.height -
        mediaQuery.padding.vertical -
        kToolbarHeight -
        kBottomNavigationBarHeight;
    final categoryList = ref.watch(categoryListProvider);
    final randomMealList = ref.watch(randomMealListProvider);
    debugPrint(
        'Home Tab Scaffold Body Height: $scaffoldBodyHeight, Device Height: ${mediaQuery.size.height}, Padding Vertical: ${mediaQuery.padding.vertical}, Toolbar Height: $kToolbarHeight, Bottom Bar Height: $kBottomNavigationBarHeight'); // Added for debugging
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: scaffoldBodyHeight,
      width: mediaQuery.size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: scaffoldBodyHeight * .05,
            width: mediaQuery.size.width,
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
            height: scaffoldBodyHeight * .1,
            width: mediaQuery.size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(.05),
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
            height: scaffoldBodyHeight * .05,
            width: mediaQuery.size.width,
            margin: const EdgeInsets.symmetric(vertical: 10),
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
            height: scaffoldBodyHeight * .4,
            width: mediaQuery.size.width,
            child: ListView.builder(
              itemCount: randomMealList.length,
              itemBuilder: (context, index) {
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
