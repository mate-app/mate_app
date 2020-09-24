import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../models/models.dart';
import '../../../../styles/styles.dart';
import 'calendar_event_property_list_item.dart';

class CalendarEventPropertyList extends StatelessWidget {
  final Event event;

  const CalendarEventPropertyList({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: MateColors.grey,
              )),
            ),
            child: Row(
              children: <Widget>[
                PlatformText(
                  'Veranstaltungsart',
                  style: MateTextstyles.small.apply(
                    color: MateColors.grey,
                  ),
                ),
                const Spacer(),
                PlatformText(event.type,
                    style: MateTextstyles.small.apply(
                      color: MateColors.eventColors[event.getType],
                    )),
              ],
            ),
          ),
          CalendarEventPropertyListItem(
            event: event.lecturers.join(', '),
            title: 'Dozierend in diesem Modul',
          ),
          CalendarEventPropertyListItem(
            event: event.location,
            title: 'Ort',
          ),
          if (event.major != "")
            CalendarEventPropertyListItem(
              event: event.major,
              title: 'Schwerpunkt',
            )
          else
            Container(),
          if (event.groups.isNotEmpty)
            CalendarEventPropertyListItem(
              event: event.groups.join(', '),
              title: 'Gruppe',
            )
          else
            Container(),
        ],
      ),
    );
  }
}
