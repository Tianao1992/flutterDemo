import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmdoel/favor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailFloatingButton extends StatelessWidget {
  final MealModel _meal;
  DetailFloatingButton(this._meal);
  Widget build(BuildContext context) {
    return Consumer<FavorViewModel>(
      builder: (context, favorVM, child) {
        final IconData favorIcon =
            favorVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
        final Color favorColor =
            favorVM.isFavor(_meal) ? Colors.red : Colors.black;

        return FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            favorVM.hanleFavorM(_meal);
          },
          child: Icon(
            favorIcon,
            color: favorColor,
          ),
        );
      },
    );
  }
}
