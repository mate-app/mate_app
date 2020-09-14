import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class DynamicText extends StatelessWidget {
  final Text Function(BuildContext) _textBuilder;

  factory DynamicText(
    String data, {
    Key key,
    TextStyle style,
    StrutStyle strutStyle,
    TextAlign textAlign,
    TextDirection textDirection,
    Locale locale,
    bool softWrap,
    TextOverflow overflow,
    double textScaleFactor,
    int maxLines,
    String semanticsLabel,
    TextWidthBasis textWidthBasis,
  }) =>
      DynamicText._(
        key,
        (BuildContext context) => Text(
          data,
          key: key,
          style: style.apply(
            // color: isCupertino(context) ? MateColors.grey : MateColors.black,
            fontWeightDelta: isCupertino(context) ? 0 : 1,
          ),
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
        ),
      );

  const DynamicText._(Key key, this._textBuilder) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _textBuilder(context);
  }
}
