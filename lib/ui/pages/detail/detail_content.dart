// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:favorcate/core/extension/int_extension.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';

class DetailContent extends StatelessWidget {
  final MealModel _meal;
  DetailContent(this._meal);
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildMakeTitle("制作材料"),
          buildMakeMaterial(context),
          buildMakeTitle("制作步骤"),
          buildMakeSteps(context)
        ],
      ),
    );
  }

  //头图
  Widget buildBannerImage() {
    return Container(
      width: double.infinity,
      child: Image.network(_meal.imageUrl),
    );
  }

  //制作材料
  Widget buildMakeMaterial(BuildContext context) {
    return buildMakrContent(
        context: context,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _meal.ingredients.length,
            itemBuilder: ((context, index) {
              return Card(
                color: Colors.amber,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.px, horizontal: 10.px),
                  child: Text(
                    _meal.ingredients[index],
                  ),
                ),
              );
            })));
  }

  // 制作步骤
  Widget buildMakeSteps(BuildContext context) {
    return buildMakrContent(
        context: context,
        child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text('#${index + 1}'),
                ),
                title: Text(_meal.steps[index]),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: _meal.steps.length));
  }

  //公共方法
  Widget buildMakeTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildMakrContent(
      {required BuildContext context, required Widget child}) {
    return Container(
      width: MediaQuery.of(context).size.width - 30.px,
      padding: EdgeInsets.all(10.px),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(16.px)),
      child: child,
    );
  }
}
