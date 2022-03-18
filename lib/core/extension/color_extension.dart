import 'package:flutter/widgets.dart';

extension colorConvert on Color {
  static Color hexadecimal(String item) {
    final colorInt = int.parse(item, radix: 16);
    final color = Color(colorInt | 0xFF000000);
    return color;
  }
}
