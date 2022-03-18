// ignore_for_file: prefer_const_constructors

import 'package:favorcate/core/extension/int_extension.dart';
import 'package:favorcate/core/viewmdoel/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterContent extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [buildChoiceTitle(context), buildChoiceSelect()],
    );
  }

  Widget buildChoiceTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text(
        '展示的选择',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildChoiceSelect() {
    return Expanded(
        child: Consumer<FilterViewModel>(builder: (context, filterVM, child) {
      return ListView(
        children: [
          buildListTile("无谷蛋白", "无谷蛋白", filterVM.isGlutenFree, (value) {
            filterVM.isGlutenFree = value;
          }),
          buildListTile("不含乳糖", "不含乳糖", filterVM.isLactoseFree, (value) {
            filterVM.isLactoseFree = value;
          }),
          buildListTile("素食主义", "素食主义", filterVM.isVegetarian, (value) {
            filterVM.isVegetarian = value;
          }),
          buildListTile("严格素食主义", "严格素食主义", filterVM.isVegan, (value) {
            filterVM.isVegan = value;
          }),
        ],
      );
    }));
  }

  Widget buildListTile(
      String title, String subtitle, bool value, void Function(bool) onChange) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.px, vertical: 8.px),
      color: Colors.amber,
      child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Switch(value: value, onChanged: onChange)),
    );
  }
}
