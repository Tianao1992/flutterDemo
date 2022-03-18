import 'package:favorcate/ui/pages/home/home.dart';
import 'package:flutter/material.dart';

import '../favor/favor.dart';

final List<Widget> items = [HomePage(), FavorPage()];

final List<BottomNavigationBarItem> bottoms = [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "收藏"),
];
