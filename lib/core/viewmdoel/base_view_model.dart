// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmdoel/filter_view_model.dart';
import 'package:flutter/material.dart';

class BaseMealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];

  FilterViewModel? _filterVM;

  void updateFilterVM(FilterViewModel vm) {
    _filterVM = vm;
  }

  List<MealModel> get meals {
    return _meals.where((meal) {
      if (_filterVM!.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM!.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM!.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM!.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  List<MealModel> get favors {
    return _meals;
  }

  set meals(List<MealModel> value) {
    _meals = value;
    notifyListeners();
  }
}
