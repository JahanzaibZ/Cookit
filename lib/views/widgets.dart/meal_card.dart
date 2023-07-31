import 'package:flutter/material.dart';

import '../../models/meal.dart';

class MealTile extends StatelessWidget {
  const MealTile({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230, // Will be ignored if used in Gridview
      width: 180, // Will be ignored if used in Gridview
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.brightness == Brightness.light
            ? const Color.fromARGB(255, 240, 240, 240)
            : const Color.fromARGB(255, 50, 50, 50),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                child: Container(
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Theme.of(context).colorScheme.brightness ==
                                Brightness.light
                            ? const Color.fromARGB(255, 240, 240, 240)
                            : const Color.fromARGB(255, 50, 50, 50),
                      ],
                    ),
                  ),
                  child: FadeInImage(
                    fit: BoxFit.contain,
                    placeholder:
                        const AssetImage('assets/images/meal_placeholder.jpg'),
                    image: NetworkImage(meal.thumbnailURL),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(meal.name),
                  const Icon(Icons.favorite_border_outlined)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
