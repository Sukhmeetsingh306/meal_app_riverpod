import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latest_meal_app_riverpod/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  vegetarian,
  lactoseFree,
  vegan,
}

// with this provider the speed the code will increase
class FiltersProviderNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersProviderNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
        });
  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
      // This is created as it will automatically change the state as whether the selected filter is true or false
    };
  }
}

final filterProvider =
    StateNotifierProvider<FiltersProviderNotifier, Map<Filter, bool>>(
  (ref) => FiltersProviderNotifier(),
);

final filterMealProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilterFromProvider = ref.watch(filterProvider);
  return meals.where((meal) {
      if (activeFilterFromProvider[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilterFromProvider[Filter.lactoseFree]! &&
          !meal.isLactoseFree) {
        return false;
      }
      if (activeFilterFromProvider[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilterFromProvider[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});