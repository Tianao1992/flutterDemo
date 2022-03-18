// ignore_for_file: avoid_print, unused_local_variable, prefer_const_constructors, empty_constructor_bodies, curly_braces_in_flow_control_structures

import 'package:favorcate/core/extension/int_extension.dart';
import 'package:favorcate/core/extension/color_extension.dart';
import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/home/home_category_item.dart';
import 'package:favorcate/ui/pages/main/initalise_items.dart';
import 'package:flutter/material.dart';

import 'package:favorcate/core/services/json_parse.dart';

class HomeContent extends StatelessWidget {
  Widget build(BuildContext context) {
    return FutureBuilder<List<HomeCategoryModel>>(
      future: JsonParse.getCategoryData(),
      builder: (cxt, snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.error != null)
          return Center(
            child: Text("请求失败"),
          );
        final _items = snapshot.data!;
        return GridView.builder(
            itemCount: _items.length,
            padding: EdgeInsets.all(20.px),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.px,
                mainAxisSpacing: 20.px,
                childAspectRatio: 1.5),
            itemBuilder: (cxt, index) {
              return HomeCategoryItem(_items[index]);
            });
      },
    );
  }
}
// class HomeContent extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _HomeContentState();
//   }
// }

// class _HomeContentState extends State<HomeContent> {
//   @override
//   List<HomeCategoryModel> _items = [];
//   void initState() {
//     super.initState();
//     JsonParse.getCategoryData().then((res) {
//       print(res);
//       setState(() {
//         _items = res;
//       });
//     });
//   }

//   Widget build(BuildContext context) {
//     return GridView.builder(
//         itemCount: _items.length,
//         padding: EdgeInsets.all(20.px),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 20.px,
//             mainAxisSpacing: 20.px,
//             childAspectRatio: 1.5),
//         itemBuilder: (cxt, index) {
//           return HomeCategoryItem(_items[index]);
//         });
//   }
// }


