import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../styles/styles.dart';

class CalendarEventPropertyListItem extends StatelessWidget {
  final String event;
  final String title;

  const CalendarEventPropertyListItem({
    Key key,
    @required this.event,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PlatformText(
                title,
                style: MateTextstyles.font.apply(
                  color: MateColors.grey,
                ),
              ),
              PlatformText(event,
                  style: MateTextstyles.font
                      .apply(color: MateColors.grey, fontWeightDelta: 2)),
            ],
          ),
        ],
      ),
    );
  }
}
