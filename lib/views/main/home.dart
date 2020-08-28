import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/views/views.dart';
import 'package:mateapp/widgets/widgets.dart';
import 'package:mateapp/services/services.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/utils/utils.dart';

// TODO: remove import use inheritance
import '../../models/event.dart';
import '../../styles/styles.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: const Text('Home'),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: handleRefresh,
        ),
        user == null
            ? SliverLoadingIndicator()
            : StreamBuilder(
                stream: Collection<Event>(
                        path: 'hochschulen/${user.university}/events',
                        queries: [
                          CustomQuery(
                            field: 'subjects',
                            operation: 'arrayContains',
                            value: user.subject,
                          ),
                          CustomQuery(
                            field: 'semester',
                            operation: '==',
                            value: user.semester,
                          ),
                        ],
                        order: ['starts_at', 'ASC'],
                        limit: 200)
                    .streamData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.hasError) {
                    return SliverLoadingIndicator();
                  }
                  return HomeList(snapshot.data);
                },
              ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
            child: Center(
              child: Text(''),
            ),
          ),
        ),
      ],
    );
  }
}

class HomeList extends StatelessWidget {
  final List<Event> events;

  HomeList(this.events);
  @override
  Widget build(BuildContext context) {
    List<DateTime> dates =
        [for (var event in events) event.date].toSet().toList();

    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      List<Event> filteredEvents =
          events.where((element) => element.date == dates[index]).toList();

      List<Widget> _createChildren(delIndex) {
        List<Widget> days = [
          HomeDate(date: dates[delIndex]),
        ];
        List<Widget> appointments =
            List<Widget>.generate(filteredEvents.length, (int index) {
          return HomeAppointments(event: filteredEvents[index]);
        });
        return [...days, ...appointments];
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // children: <Widget>[for (var item in list) Text(item)],
        children: _createChildren(index),
      );
    }, childCount: dates?.length ?? 0));
  }
}

//Creates the Home List
class HomeDate extends StatelessWidget {
  /// Creates the top of each List with the Related Date [homeDate]
  ///
  final DateTime date;

  //Constructor
  HomeDate({
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    // var event = Provider.of<List<Event>>(context);

    initializeDateFormatting('de_DE', null);

    if (date.day == DateTime.now().day &&
        date.month == DateTime.now().month &&
        date.year == DateTime.now().year) {
      return Container(
        decoration: BoxDecoration(
          boxShadow: [
            Styles.boxShadow,
          ],
          borderRadius: Styles.roundedEdges,
          gradient: Styles.gradientPrimary,
        ),
        height: 30,
        margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Text(convertDateToString(date)),
      );
    } else {
      return Container(
          decoration: BoxDecoration(
            boxShadow: [
              Styles.boxShadow,
            ],
            borderRadius: Styles.roundedEdges,
            gradient: Styles.lightGradientPrimary,
          ),
          height: 30,
          margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Text(convertDateToString(date)));
    }
  }
}

class HomeAppointments extends StatelessWidget {
  /// Creates a List with all events of the Day, using [homeEventName; homeEventStart; homeEventEnd; homeEventLocation; homeEventType;]

  final Event event;

  // Constructor
  HomeAppointments({Key key, this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: CupertinoButton(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        onPressed: () {
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) {
              return HomeVeranstaltung();
            }),
          );
        },
        child: Row(
          children: <Widget>[
            Column(children: <Widget>[
              Text(event.getStartsAt,
                  style: Styles.small.apply(color: Styles.grey)),
              Padding(padding: EdgeInsetsDirectional.only(top: 5)),
              Text(event.getEndsAt,
                  style: Styles.small.apply(color: Styles.lightGrey))
            ]),
            Container(
              color: Styles.primary,
              height: 35,
              width: 1,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(
                      minWidth: 100,
                      maxWidth: MediaQuery.of(context).size.width * 0.58,
                    ),
                    child: Text(
                      event.courseName,
                      style: Styles.font.apply(
                        color: Styles.grey,
                        fontWeightDelta: 2,
                      ),
                    ),
                  ),
                  Text(
                    event.location,
                    style: Styles.font.apply(color: Styles.lightGrey),
                  )
                ]),
            Spacer(),
            Column(children: <Widget>[
              Text(event.getType, style: Styles.font.apply(color: Styles.grey))
            ]),
          ],
        ),
      ),
    );
  }
}
