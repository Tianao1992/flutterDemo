import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:favorcate/core/model/category_model.dart';

class JsonParse {
  static Future<List<HomeCategoryModel>> getCategoryData() async {
    final jsonStr = await rootBundle.loadString('assets/json/category.json');
    final result = json.decode(jsonStr);
    final list = result["category"];
    List<HomeCategoryModel> items = [];
    for (var json in list) {
      items.add(HomeCategoryModel.fromJson(json));
    }
    return items;
  }
}
