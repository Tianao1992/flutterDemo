import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/storage/storage.dart';
import 'package:favorcate/core/viewmdoel/base_view_model.dart';
import 'package:favorcate/core/viewmdoel/filter_view_model.dart';
import 'package:flutter/material.dart';

class FavorViewModel extends BaseMealViewModel {
  FavorViewModel() {
    Storage.getFarovList().then((resList) {
      meals = resList;
    });
  }
  void addMeal(MealModel model) {
    favors.add(model);
    notifyListeners();
  }

  @override
  void updateFilterVM(FilterViewModel vm) {
    super.updateFilterVM(vm);
    notifyListeners();
  }

  void removeMeal(MealModel model) {
    favors.remove(model);
    notifyListeners();
  }

  void hanleFavorM(MealModel model) {
    if (isFavor(model) == false) {
      addMeal(model);
      Storage.saveDataFavor(model);
    } else {
      Storage.removeFavor(model);
      removeMeal(model);
    }
  }

  bool isFavor(MealModel model) {
    return favors.contains(model);
  }
}
