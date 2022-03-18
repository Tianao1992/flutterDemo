// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:favorcate/core/extension/color_extension.dart';
import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

class HomeCategoryItem extends StatelessWidget {
  final HomeCategoryModel _category;

  HomeCategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    final Color bgColor = colorConvert.hexadecimal(_category.color!);

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
            gradient:
                LinearGradient(colors: [bgColor.withOpacity(.5), bgColor])),
        alignment: Alignment.center,
        child: Text(
          _category.title!,
          style: TextStyle(
              fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(MealScreen.routeName, arguments: _category);
      },
    );
  }
}
