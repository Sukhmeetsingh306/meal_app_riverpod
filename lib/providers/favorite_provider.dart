import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/meals_model.dart';

// state Notifier class name should always end with Notifier
class FavoriteMealsProviderNotifier extends StateNotifier<List<MealModel>> {
  FavoriteMealsProviderNotifier() : super([]);

// in the provider add() & remove() is not allowed we have replace() it
  bool toggleMealFavoriteStatus(MealModel meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state
          .where((mealIsPresentInList) => mealIsPresentInList.id != meal.id)
          .toList();
          return false;
      // this is if a new meal is added to the List other meal is not replaced
    } else {
      // (...) this is spread operator
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
/// we have added the functionality in the <> that it should effect
    StateNotifierProvider<FavoriteMealsProviderNotifier, List<MealModel>>(
        (ref) {
  return FavoriteMealsProviderNotifier();
});
