import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../models/models.dart';
import '../../../styles/styles.dart';
import '../calendar_event/calendar_event.dart';

class CalendarListEvent extends StatelessWidget {
  final Event event;

  const CalendarListEvent({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: PlatformButton(
        padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
        onPressed: () {
          Navigator.push(
              context,
              platformPageRoute(
                  context: context,
                  builder: (context) => CalendarEvent(event: event)));
        },
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.12,
              child: Column(
                children: <Widget>[
                  PlatformText(event.startsAt.onlyTime,
                      style:
                          MateTextstyles.small.apply(color: MateColors.grey)),
                  const Padding(padding: EdgeInsetsDirectional.only(top: 5)),
                  PlatformText(event.endsAt.onlyTime,
                      style: MateTextstyles.small
                          .apply(color: MateColors.lightGrey))
                ],
              ),
            ),
            Container(
                height: 35,
                width: 2,
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  borderRadius: MateShapes.roundedEdges,
                  color: MateColors.eventColors[event.shortType],
                )),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                      minWidth: 100,
                      maxWidth: MediaQuery.of(context).size.width * 0.58,
                    ),
                    child: PlatformText(
                      event.courseName,
                      style: MateTextstyles.font.apply(
                        color: MateColors.grey,
                        fontWeightDelta: 2,
                      ),
                    ),
                  ),
                  PlatformText(
                    event.location,
                    style:
                        MateTextstyles.font.apply(color: MateColors.lightGrey),
                  )
                ]),
            const Spacer(),
            Column(children: <Widget>[
              PlatformText(event.shortType,
                  style: MateTextstyles.font.apply(color: MateColors.grey))
            ]),
          ],
        ),
      ),
    );
  }
}
