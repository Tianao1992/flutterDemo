// ignore_for_file: prefer_function_declarations_over_variables

import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:favorcate/ui/pages/main/main.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

class TRouter {
  static final String initialRoute = HomeMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    HomeMainScreen.routeName: (ctx) => HomeMainScreen(),
    MealScreen.routeName: (context) => MealScreen(),
    HDetail.routeName: (context) => HDetail(),
    FilterScreen.routeName: (context) => FilterScreen()
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}
