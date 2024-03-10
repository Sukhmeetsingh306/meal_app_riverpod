import 'package:flutter/material.dart';
import 'package:latest_meal_app_riverpod/model/dummy_model.dart';
import 'package:latest_meal_app_riverpod/screen/meals_screen.dart';
import 'package:latest_meal_app_riverpod/widget/category_grid_item_widget.dart';

import '../model/category_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _selectCategory(BuildContext context, CategoryModel category) {
    final filteredMeals = dummyMealModels
        .where(
          (meal) => meal.categories.contains(
            category.id,
          ),
        )
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          //availableCategories.map((category) => CategoryGridItemWidget(category: category)).toList(); // cam also written in this way
          for (final category in availableCategories)
            CategoryGridItemWidget(
              category: category,
              onSelectedCategory: () {
                _selectCategory(
                  context,
                  category,
                );
              },
            )
        ],
      ),
    );
  }
}
