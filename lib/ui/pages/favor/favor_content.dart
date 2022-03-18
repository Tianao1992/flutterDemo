import 'package:favorcate/core/viewmdoel/favor_view_model.dart';
import 'package:favorcate/ui/pages/meal/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavorContent extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<FavorViewModel>(builder: (context, favorVM, child) {
      return ListView.builder(
          itemCount: favorVM.favors.length,
          itemBuilder: ((context, index) {
            return MealItem(favorVM.favors[index]);
          }));
    });
  }
}
