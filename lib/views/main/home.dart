import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/views/views.dart';
import 'package:mateapp/widgets/widgets.dart';
import 'package:mateapp/services/services.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/utils/utils.dart';

// TODO: remove import use inheritance
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
                          )
                        ],
                        order: ['starts_at', 'ASC'],
                        limit: 200)
                    .streamData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.hasError) {
                    print(snapshot.error);
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
    List<DateTime> dates = [for (var event in events) event.date]
        .toSet()
        .toList()
        .where((element) => element.compareTo(
                  DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                  ),
                ) >
                0
            ? true
            : false)
        .toList();

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
          children: _createChildren(index),
        );
      }, childCount: dates?.length ?? 0),
    );
  }
}

class HomeDate extends StatelessWidget {
  final DateTime date;

  HomeDate({
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('de_DE', null);

    bool isToday = (date.day == DateTime.now().day &&
            date.month == DateTime.now().month &&
            date.year == DateTime.now().year)
        ? true
        : false;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          MateShadows.boxShadow,
        ],
        borderRadius: MateShapes.roundedEdges,
        gradient: isToday ? MateGradients.primary : MateGradients.primary,
      ),
      height: 30,
      width: MediaQuery.of(context).size.width * 0.95,
      margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
      padding: EdgeInsets.fromLTRB(
        15,
        isToday ? 4 : 5,
        15,
        5,
      ),
      child: Text(
        isToday ? 'Heute' : convertDateToString(date),
        style: MateTextstyles.font.apply(
            color: MateColors.white,
            fontWeightDelta: isToday ? 4 : 1,
            fontSizeDelta: isToday ? 2 : 1),
      ),
    );
  }
}

class HomeAppointments extends StatelessWidget {
  final Event event;

  HomeAppointments({Key key, this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: CupertinoButton(
        padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
        onPressed: () {
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) {
              return HomeVeranstaltung(
                event: event,
              );
            }),
          );
        },
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.12,
              child: Column(
                children: <Widget>[
                  Text(event.getStartsAt,
                      style:
                          MateTextstyles.small.apply(color: MateColors.grey)),
                  Padding(padding: EdgeInsetsDirectional.only(top: 5)),
                  Text(event.getEndsAt,
                      style: MateTextstyles.small
                          .apply(color: MateColors.lightGrey))
                ],
              ),
            ),
            Container(
                height: 35,
                width: 2,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  borderRadius: MateShapes.roundedEdges,
                  color: MateColors.eventColors[event.getType],
                )),
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
                      style: MateTextstyles.font.apply(
                        color: MateColors.grey,
                        fontWeightDelta: 2,
                      ),
                    ),
                  ),
                  Text(
                    event.location,
                    style:
                        MateTextstyles.font.apply(color: MateColors.lightGrey),
                  )
                ]),
            Spacer(),
            Column(children: <Widget>[
              Text(event.getType,
                  style: MateTextstyles.font.apply(color: MateColors.grey))
            ]),
          ],
        ),
      ),
    );
  }
}
