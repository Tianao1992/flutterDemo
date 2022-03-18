// ignore_for_file: prefer_const_constructors

import 'package:favorcate/core/extension/int_extension.dart';
import 'package:favorcate/ui/pages/favor/favor.dart';
import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDarwer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      width: 250.px,
      child: Drawer(
        child: Column(
          children: [
            buildHeaderView(context),
            buildListTile(context, Icon(Icons.restaurant), "进餐", () {
              Navigator.of(context).pop();
            }),
            buildListTile(context, Icon(Icons.settings), "过滤", () {
              Navigator.of(context).pushNamed(FilterScreen.routeName);
            })
          ],
        ),
      ),
    );
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.px,
      color: Colors.orange,
      margin: EdgeInsets.only(bottom: 20.px),
      alignment: Alignment(0, 0.5),
      child: Text(
        '开始动手',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildListTile(BuildContext context, Widget icon, String title,
      void Function() handler) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 24),
      ),
      onTap: handler,
    );
  }
}
