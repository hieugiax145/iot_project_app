import 'dart:ui';

import 'package:flutter/material.dart';

class AppFonts {
  AppFonts._();

  //FontWeight 400
  static TextStyle light([double fontSize = 14, Color color = Colors.black]) =>
      TextStyle(
        height: 0.8,
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: color,
      );

  //FontWeight 500
  static TextStyle regular(
      [double fontSize = 14, Color color = Colors.black]) =>
      TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: color,
      );

  //FontWeight 600
  static TextStyle normalBold(
      [double fontSize = 14, Color color = Colors.black]) =>
      TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
        color: color,
      );

  //FontWeight 700
  static TextStyle bold([double fontSize = 14, Color color = Colors.black]) =>
      TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        color: color,
      );

  //FontWeight 800
  static TextStyle ultraBold(
      [double fontSize = 14, Color color = Colors.black]) =>
      TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: fontSize,
        color: color,
      );
}
