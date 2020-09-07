import 'package:flutter/material.dart';

import 'colors.dart';

class MateGradients {
  static const gradientPrimary = LinearGradient(
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
  static const lightGradientPrimary = LinearGradient(
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
  static const gradientSecondary = LinearGradient(
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
  static const gradientThird = LinearGradient(
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
}

class NewsGradients {
  static const newsColor = {
    "Allgemein": MateGradients.gradientPrimary,
    "Wirtschaft": MateGradients.gradientSecondary,
    "Maschinenwesen": MateGradients.gradientSecondary,
    "Soziale Arbeit und Gesundheit": MateGradients.gradientSecondary,
    "Informatik und Elektrotechnik": MateGradients.gradientSecondary,
    "Medien / Bauwesen": MateGradients.gradientSecondary,
    "Agrarwirtschaft": MateGradients.gradientSecondary,
  };
}

class EventGradients {
  static const eventGradient = {
    "VL": MateGradients.gradientPrimary,
    "SE": MateGradients.gradientSecondary,
    "Ü": MateGradients.gradientSecondary,
    "Wahlmodul": MateGradients.gradientThird,
    "Praxis": MateGradients.gradientSecondary,
    "Vorlesung/Labor": MateGradients.gradientPrimary,
  };
}
