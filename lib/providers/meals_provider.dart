import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latest_meal_app_riverpod/model/dummy_model.dart';

final mealsProvider = Provider((ref){
  return dummyMealModels;
});