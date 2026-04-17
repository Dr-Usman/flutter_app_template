import 'package:flutter/material.dart';

class AppColors {
  static const Color orange = Color(0xFFFF9800);
  // static const Color orange = Color(0xFFF4521E);
  static const Color lightOrange = Color(0xFFFFCC80);
  static const Color darkOrange = Color(0xFFFF5722);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static Color lightGrey = Colors.grey.shade300;
  static const Color red = Colors.red;

  static const Color background = white;

  static LinearGradient get shadowLight => LinearGradient(
    begin: Alignment.topCenter,
    colors: [
      Colors.orange.shade900,
      Colors.orange.shade800,
      Colors.orange.shade400,
    ],
  );

  static Color get primary => orange;
  static Color get secondary => darkOrange;
  static Color get accent => lightOrange;
  static Color get textPrimary => black;
  static Color get textSecondary => grey;
  static Color get textTertiary => white;
  static Color get backgroundPrimary => background;
  static Color get errorColor => red;
}
