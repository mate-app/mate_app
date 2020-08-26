// Packages importieren, weil TextStyle instanziert wird
import 'package:flutter/cupertino.dart';

// Style Klasse
abstract class Styles {
  //Colors
  static const primary = Color(0xffff9933);
  static const secondary = Color(0xffff8151);
  static const third = Color(0xff03c8bb);
  static const white = Color(0xffffffff);
  static const grey = Color(0xff525252);
  static const lightGrey = Color(0xaa525252);

  //Gradients
  static const gradientPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    stops: [0.0, 0.12, 0.78, 1.0],
    colors: [
      const Color(0xFFFFA041),
      const Color(0xFFFFB56C),
      const Color(0xFFFF9F3F),
      primary
    ],
  );
  static const lightGradientPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    stops: [0.0, 0.12, 0.78, 1.0],
    colors: [
      const Color(0xAAFFA041),
      const Color(0xAAFFB56C),
      const Color(0xAAFF9F3F),
      const Color(0xAAFF9933)
    ],
  );
  static const gradientSecondary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    stops: [0.0, 0.12, 0.78, 1.0],
    colors: [
      const Color(0xFFFF8A5D),
      const Color(0xFFFFA481),
      const Color(0xFFFF885B),
      secondary
    ],
  );
  static const gradientThird = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 0.0),
    stops: [0.0, 0.12, 0.78, 1.0],
    colors: [
      const Color(0xFF14CCC0),
      const Color(0xFF4BD8CE),
      const Color(0xFF0DCABE),
      third
    ],
  );

  static const newsColor = {
    "Allgemein": gradientPrimary,
    "Wirtschaft": gradientSecondary,
    "Maschinenwesen": gradientSecondary,
    "Soziale Arbeit und Gesundheit": gradientSecondary,
    "Informatik und Elektrotechnik": gradientSecondary,
    "Medien / Bauwesen": gradientSecondary,
    "Agrarwirtschaft": gradientSecondary,
  };
  //Font
  static const h1 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );
  static const h2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static const font = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );
  static const small = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
  static const tiny = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  //Shadow
  static const boxShadow = BoxShadow(
    color: Color(0x16000000),
    offset: Offset(1, 3),
    blurRadius: 3.0,
    spreadRadius: 1.0,
  );

  //Border
  static var roundedEdges = BorderRadius.circular(8);
}
