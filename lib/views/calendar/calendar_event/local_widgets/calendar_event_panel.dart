import 'package:flutter/material.dart';

import '../../../../models/models.dart';
import '../../../../styles/styles.dart';

class CalendarEventPanel extends StatelessWidget {
  final Event event;

  const CalendarEventPanel({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: MateShapes.roundedEdges,
        gradient: MateGradients.eventGradient[event.shortType],
      ),
      height: 160,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(event.courseName,
              style: MateTextstyles.h1.apply(color: MateColors.white)),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                child: Text(
                  event.date.asString,
                  style: MateTextstyles.font.apply(
                    color: MateColors.white,
                    fontWeightDelta: 2,
                  ),
                ),
              ),
              Text(
                '${event.startsAt.onlyTime} - ${event.startsAt.onlyTime}',
                style: MateTextstyles.font.apply(
                  color: MateColors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
