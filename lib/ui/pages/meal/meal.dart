import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/ui/pages/meal/meal_content.dart';
import 'package:flutter/material.dart';

class MealScreen extends StatelessWidget {
  static const String routeName = "/meal";

  Widget build(BuildContext context) {
    final item =
        ModalRoute.of(context)!.settings.arguments as HomeCategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title!),
      ),
      body: MealContent(),
    );
  }
}
