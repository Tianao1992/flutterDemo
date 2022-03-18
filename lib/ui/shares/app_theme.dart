// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {
  static const double bodyFontSize = 14;
  static const double samllFontSize = 16;
  static const double normalFontSize = 22;
  static const double largerFontSize = 44;

  static final Color norTextColor = Colors.red;

  static final ThemeData normTheme = ThemeData(
    primarySwatch: Colors.pink,
    canvasColor: Color.fromRGBO(255, 254, 222, 1),
  );
}
