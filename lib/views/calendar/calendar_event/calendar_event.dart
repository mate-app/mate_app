import 'package:flutter/material.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/widgets/widgets.dart';
import 'local_widgets/local_widgets.dart';

class CalendarEvent extends StatelessWidget {
  final Event event;

  const CalendarEvent({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: StaticNavigationBar('Mitteilung'),
          pinned: true,
          floating: true,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          CalendarEventPanel(
            event: event,
          ),
          CalendarEventPropertyList(
            event: event,
          )
        ])),
      ],
    );
  }
}
