import 'dart:ffi';

import 'package:flutter/material.dart';

// TODO: remove import use inheritance
import 'package:mateapp/styles/styles.dart';

class Tag extends StatelessWidget {
  final String tag;
  double margin_right;
  double margin_bottom;

// TODO: 0 default margin, turn around with mensa screen
  // Constructor
  Tag(
      {Key key,
      this.tag = '',
      this.margin_right = 10.0,
      this.margin_bottom = 20.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(right: margin_right, bottom: margin_bottom),
      decoration: BoxDecoration(
          border: Border.all(color: MateColors.white, width: 1.0),
          borderRadius: MateShapes.roundedEdges),
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.fiber_manual_record,
            color: MateColors.white,
            size: 12.0,
            semanticLabel: 'dot',
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Text(
              tag,
              style: MateTextstyles.tiny.apply(color: MateColors.white),
            ),
          )
        ],
      ),
    );
  }
}
