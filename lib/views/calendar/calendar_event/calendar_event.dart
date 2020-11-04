import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../shared/shared.dart';
import '../../../styles/styles.dart';
import 'local_widgets/local_widgets.dart';

class CalendarEvent extends StatelessWidget {
  final Event event;

  const CalendarEvent({Key key, this.event}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MateColors.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar(title: 'Mitteilung'),
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
      ),
    );
  }
}
