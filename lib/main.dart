import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:latest_meal_app_riverpod/model/dummy_model.dart';
import 'package:latest_meal_app_riverpod/screen/categories_screen.dart';
import 'package:latest_meal_app_riverpod/screen/meals_screen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: MealsScreen(
        title: 's ',
        meals: dummyMealModels,
      ),
    );
  }
}
