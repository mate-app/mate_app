import 'dart:ui';

class MateColors {
  static const primary = Color(0xffff9933);
  static const secondary = Color(0xffff8151);
  static const third = Color(0xff03c8bb);
  static const white = Color(0xffffffff);
  static const grey = Color(0xff525252);
  static const lightGrey = Color(0xaa525252);
}

class EventColors {
  static const eventColor = {
    "VL": MateColors.primary,
    "SE": MateColors.secondary,
    "Ü": MateColors.secondary,
    "Wahlmodul": MateColors.third,
    "Praxis": MateColors.secondary,
    "Vorlesung/Labor": MateColors.primary,
  };
}

class StatusColors {
  static const gradeStatus = {
    'BE': Color(0xff03c838),
    'NB': MateColors.secondary,
  };
}
