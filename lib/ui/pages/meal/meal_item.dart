// ignore_for_file: prefer_const_constructors

import 'package:favorcate/core/extension/int_extension.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmdoel/favor_view_model.dart';
import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final cardRadius = 12.px;

class MealItem extends StatelessWidget {
  final MealModel model;
  MealItem(this.model);
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius)),
        child: Column(
          children: [buildBasicInfo(context), buildOperationInfo()],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(HDetail.routeName, arguments: model);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(cardRadius),
              topRight: Radius.circular(cardRadius)),
          child: Image.network(
            model.imageUrl,
            width: double.infinity,
            height: 250.px,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            right: 10.px,
            bottom: 10.px,
            child: Container(
              width: 300.px,
              padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(6.px)),
              child: Text(
                model.title,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ))
      ],
    );
  }

  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.all(5.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HYOperationItem(Icon(Icons.schedule), "${model.duration}分钟"),
          HYOperationItem(Icon(Icons.restaurant), "${model.complexStr}"),
          buildFavor()
        ],
      ),
    );
  }

  Widget buildFavor() {
    return Consumer<FavorViewModel>(builder: (context, favorVM, index) {
      final iconData =
          favorVM.isFavor(model) ? Icons.favorite : Icons.favorite_border;

      final favorColor = favorVM.isFavor(model) ? Colors.red : Colors.black;
      final title = favorVM.isFavor(model) ? "收藏" : "未收藏";
      return GestureDetector(
          onTap: () {
            favorVM.hanleFavorM(model);
          },
          child: HYOperationItem(
            Icon(
              iconData,
              color: favorColor,
            ),
            title,
            textColor: favorColor,
          ));
    });
  }
}

class HYOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  final Color textColor;
  HYOperationItem(this._icon, this._title, {this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.px,
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _icon,
          SizedBox(
            width: 3.px,
          ),
          Text(
            _title,
            style: TextStyle(color: textColor),
          )
        ],
      ),
    );
  }
}
