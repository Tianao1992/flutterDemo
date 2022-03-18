import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/services/meal_request.dart';
import 'package:favorcate/core/viewmdoel/base_view_model.dart';
import 'package:favorcate/ui/pages/main/initalise_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealViewModel extends BaseMealViewModel {
  List<MealModel> _storages = [];
  set storages(List<MealModel> value) {
    _storages = value;
  }

  MealViewModel() {
    MealRequest.getMealData().then((res) {
      replaceMeals(res, _storages);
      meals = res;
    });
  }
  void replaceMeals(List<MealModel> list1, List<MealModel> list2) {
    if (list2.isEmpty || list1.isEmpty) {
      return;
    }
    List<MealModel> tmplist = [];
    for (var i = 0; i < list1.length; i++) {
      MealModel item = list1[i];
      for (var j = 0; j < list2.length; j++) {
        MealModel item1 = list2[j];
        if (item.id == item1.id) {
          tmplist.add(item);
        }
      }
    }
    for (var model in tmplist) {
      list1.remove(model);
    }
    list1.addAll(list2);
  }
}
