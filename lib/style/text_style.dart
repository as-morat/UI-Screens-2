import 'package:flutter/material.dart';
import 'color_style.dart';

class MyText {
  static const h1 = TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: darkColor);
  static const h2 = TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: darkColor);
  static const h3 = TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: darkColor);
  static const h4 = TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: darkColor);
  static const h5 = TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: darkColor);
  static const h6 = TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: darkColor);
  static const h7 = TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: darkColor);
  static const h8 = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: darkColor);


  static TextStyle withColor(TextStyle style, Color color) => style.copyWith(color: color);
  static TextStyle withWeight(TextStyle style, FontWeight weight) => style.copyWith(fontWeight: weight);
  static TextStyle withSize(TextStyle style, double size) => style.copyWith(fontSize: size);
}
