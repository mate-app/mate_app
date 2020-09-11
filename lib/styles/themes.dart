import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/styles/styles.dart';

CupertinoThemeData buildCupertinoThemeData() {
  return const CupertinoThemeData(
    barBackgroundColor: MateColors.white,
    primaryColor: MateColors.primary,
    scaffoldBackgroundColor: MateColors.white,
    brightness: Brightness.light,
    textTheme: CupertinoTextThemeData(
      primaryColor: MateColors.primary,
    ),
  );
}

ThemeData buildThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: MateColors.white,
    brightness: Brightness.light,
  );
}
