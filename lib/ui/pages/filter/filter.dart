import 'package:favorcate/ui/pages/filter/filter_content.dart';
import 'package:flutter/material.dart';
import 'filter_content.dart';

class FilterScreen extends StatelessWidget {
  static final String routeName = "/filter";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('筛选'),
      ),
      body: FilterContent(),
    );
  }
}
