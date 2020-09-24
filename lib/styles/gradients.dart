import 'package:flutter/material.dart';

import 'colors.dart';

class MateGradients {
  static const primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    stops: [0.0, 0.12, 0.78, 1.0],
    colors: [
      Color(0xFFFFA041),
      Color(0xFFFFB56C),
      Color(0xFFFF9F3F),
      MateColors.primary,
    ],
  );
  static const lightPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    stops: [0.0, 0.12, 0.78, 1.0],
    colors: [
      Color(0xAAFFA041),
      Color(0xAAFFB56C),
      Color(0xAAFF9F3F),
      Color(0xAAFF9933),
    ],
  );
  static const secondary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    stops: [0.0, 0.12, 0.78, 1.0],
    colors: [
      Color(0xFFFF8A5D),
      Color(0xFFFFA481),
      Color(0xFFFF885B),
      MateColors.secondary,
    ],
  );
  static const third = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    stops: [0.0, 0.12, 0.78, 1.0],
    colors: [
      Color(0xFF14CCC0),
      Color(0xFF4BD8CE),
      Color(0xFF0DCABE),
      MateColors.third,
    ],
  );

  static const newsGradient = {
    "Allgemein": primary,
    "Wirtschaft": secondary,
    "Maschinenwesen": secondary,
    "Soziale Arbeit und Gesundheit": secondary,
    "Informatik und Elektrotechnik": secondary,
    "Medien / Bauwesen": secondary,
    "Agrarwirtschaft": secondary,
  };

  static const eventGradient = {
    "VL": primary,
    "SE": secondary,
    "Ü": secondary,
    "Wahlmodul": third,
    "Praxis": secondary,
    "Vorlesung/Labor": primary,
  };
}
