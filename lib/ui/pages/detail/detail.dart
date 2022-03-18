// ignore_for_file: prefer_const_constructors

import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/ui/pages/detail/float_botton.dart';
import 'package:flutter/material.dart';
import 'detail_content.dart';

class HDetail extends StatelessWidget {
  static final String routeName = "/detail";

  Widget build(BuildContext context) {
    final model = ModalRoute.of(context)!.settings.arguments as MealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
      ),
      body: DetailContent(model),
      floatingActionButton: DetailFloatingButton(model),
    );
  }
}
