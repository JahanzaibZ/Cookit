import 'package:flutter/material.dart';

import '../../models/meal.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.meal,
  });

  final Meal meal;
  final lightColor = Colors.white;
  final darkColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215, // Will be ignored if used in Gridview
      width: 180, // Will be ignored if used in Gridview
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.brightness == Brightness.light
            ? lightColor
            : darkColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border.all(
                    color: Theme.of(context).colorScheme.brightness ==
                            Brightness.light
                        ? lightColor
                        : darkColor,
                    width: 1),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  // bottomLeft: Radius.circular(10),
                  // bottomRight: Radius.circular(10),
                ),
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.contain,
                  placeholder: 'assets/images/meal_placeholder.jpg',
                  image: meal.thumbnailURL,
                  imageErrorBuilder: (context, error, stackTrace) {
                    debugPrint('Image Loading Error: $error');
                    return Image.asset('assets/images/meal_placeholder.jpg');
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 500,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.brightness == Brightness.light
                      ? lightColor
                      : darkColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              border: Border.all(
                  color: Theme.of(context).colorScheme.brightness ==
                          Brightness.light
                      ? lightColor
                      : darkColor,
                  width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(meal.name),
                const Icon(Icons.favorite_border_outlined)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
