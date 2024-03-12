import 'package:flutter/material.dart';
import 'package:latest_meal_app_riverpod/screen/tabs_screen.dart';
import 'package:latest_meal_app_riverpod/widget/drawer_widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yours Filters',
        ),
      ),
      drawer: MainDrawerWidget(onSelectScreen: (identifier) {
        Navigator.of(context).pop();
        if (identifier == 'meals') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const TabScreen();
              },
            ),
          );
        }
      }),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFreeFilter,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeFilter = isChecked;
              });
            },
            title: Text(
              'Gluten-Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include the Gluten-Free Meal',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(
              left: 34,
              right: 22,
            ),
          )
        ],
      ),
    );
  }
}