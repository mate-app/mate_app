import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../styles/styles.dart';

class Tag extends StatelessWidget {
  final String tag;
  final double marginRight;
  final double marginBottom;

  // Constructor
  const Tag(
      {Key key,
      this.tag = '',
      this.marginRight = 10.0,
      this.marginBottom = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: marginRight, bottom: marginBottom),
      decoration: BoxDecoration(
          border: Border.all(color: MateColors.white),
          borderRadius: MateShapes.roundedEdges),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          const Icon(
            Icons.fiber_manual_record,
            color: MateColors.white,
            size: 12.0,
            semanticLabel: 'dot',
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: PlatformText(
              tag,
              style: MateTextstyles.tiny.apply(color: MateColors.white),
            ),
          )
        ],
      ),
    );
  }
}
