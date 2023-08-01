import 'package:flutter/material.dart';

import '../../models/category.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.categoryList,
  });

  final List<Category> categoryList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (_, index) {
          return Container(
            width: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.brightness ==
                      Brightness.light
                  ? Colors.white
                  : Colors
                      .black, // Used the context of the build fn as ListView's context was causing a problem (The CategoryList widget would not rebuild on theme change)
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
    );
  }
}
