import 'package:flutter/material.dart';

import '../../../models/models.dart';
import 'local_widgets.dart';

class CalendarList extends StatelessWidget {
  final List<Event> events;

  const CalendarList({
    Key key,
    this.events,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DateTime> dates = {for (var event in events) event.date}
        .toList()
        .where((element) =>
            element.compareTo(
                  DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                  ),
                ) >
                0 ||
            false)
        .toList();
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        final List<Event> filteredEvents =
            events.where((element) => element.date == dates[index]).toList();

        List<Widget> _createChildren(int delIndex) {
          final List<Widget> days = [
            CalendarListDate(date: dates[delIndex]),
          ];
          final List<Widget> appointments =
              List<Widget>.generate(filteredEvents.length, (int index) {
            return CalendarListEvent(event: filteredEvents[index]);
          });
          return [...days, ...appointments];
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _createChildren(index),
        );
      }, childCount: dates?.length ?? 0),
    );
  }
}
