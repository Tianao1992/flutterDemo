import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmdoel/meal_viewmdoel.dart';
import 'package:favorcate/ui/pages/meal/meal_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealContent extends StatelessWidget {
  Widget build(BuildContext context) {
    final item =
        ModalRoute.of(context)!.settings.arguments as HomeCategoryModel;
    return Selector<MealViewModel, List<MealModel>>(
      selector: (cxt, mealVM) {
        return mealVM.meals
            .where((meal) => meal.categories.contains(item.id))
            .toList();
      },
      shouldRebuild: (pre, next) {
        return !listEquals(pre, next);
      },
      builder: (context, meals, child) {
        return ListView.builder(
            itemCount: meals.length,
            itemBuilder: ((context, index) {
              return MealItem(meals[index]);
            }));
      },
    );
  }
}

// class MealContent extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final category = ModalRoute.of(context)!.settings.arguments as HomeCategoryModel;
//    return Consumer<MealViewModel>(
//      builder: (ctx, mealVM, child) {
//        final meals = mealVM.items.where((meal) => meal.categories.contains(category.id)).toList();
//        return ListView.builder(
//          itemCount: meals.length,
//          itemBuilder: (ctx, index) {
//            return ListTile(title: Text(meals[index].title),);
//          }
//        );
//      }
//    );
//  }
// }