import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//本地存储类
class Storage {
  static const String favorListkey = "favorListkey";
  // 存储收藏列表
  static Future<bool> saveDataFavor(MealModel meal) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? list = prefs.getStringList(favorListkey);
    if (list != null) {
      list.add(mealModelToJson(meal));
    } else {
      list = [];
      list.add(mealModelToJson(meal));
    }
    final bool isSave = await prefs.setStringList(favorListkey, list);
    return isSave;
  }

  static removeFavor(MealModel meal) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? list = prefs.getStringList(favorListkey);
    if (list == null) {
      return;
    }
    for (var i = 0; i < list.length; i++) {
      String itemStr = list[i];
      MealModel item = MealModel.fromJson(jsonDecode(itemStr));
      if (item.id == meal.id) {
        list.removeAt(i);
        break;
      }
    }
    await prefs.setStringList(favorListkey, list);
  }

  static Future<List<MealModel>> getFarovList() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? list = prefs.getStringList(favorListkey);
    List<MealModel> items = [];
    if (list == null) {
      return items;
    }
    for (var str in list) {
      MealModel item = MealModel.fromJson(jsonDecode(str));
      items.add(item);
    }
    return items;
  }

  static Future<bool> removeAllFavorList() async {
    final prefs = await SharedPreferences.getInstance();
    final success = await prefs.remove(favorListkey);
    return success;
  }
}
