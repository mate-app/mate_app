import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/views/views.dart';
import 'package:mateapp/models/models.dart';

// TODO: remove import use inheritance
import '../../styles/styles.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: switch to stream provider with new coding style
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('hochschulen')
          .doc('fhkiel')
          .collection('events')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        List<QueryDocumentSnapshot> events = snapshot.data.docs;

        return CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: const Text('Home'),
            ),
            HomeList(events),
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
      },
    );
  }
}

class HomeList extends StatelessWidget {
  var events;

  HomeList(this.events);
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Day();
    }, childCount: events != null ? events.length : 0));
  }
}

class Day extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // children: <Widget>[for (var item in list) Text(item)],
      children: <Widget>[],
    );
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
    var events = Provider.of<List<Event>>(context);

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
        child: Text(DateFormat('dd. MMM y', 'de_DE').format(date),
            style: Styles.font.apply(
              color: Styles.white,
              fontWeightDelta: 2,
            )),
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
        child: Text(DateFormat('dd. MMM y', 'de_DE').format(date),
            style: Styles.font.apply(
              color: Styles.white,
              fontWeightDelta: 2,
            )),
      );
    }
  }
}

class HomeAppointments extends StatelessWidget {
  /// Creates a List with all events of the Day, using [homeEventName; homeEventStart; homeEventEnd; homeEventLocation; homeEventType;]

  final Event event;

  // Constructor
  HomeAppointments({
    Key key,
    this.event,
  });

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
              Text(DateFormat('HH:MM', 'de_DE').format(event.startsAt),
                  style: Styles.small.apply(color: Styles.grey)),
              Padding(padding: EdgeInsetsDirectional.only(top: 5)),
              Text(DateFormat('HH:MM', 'de_DE').format(event.endsAt),
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
              Text(event.type, style: Styles.font.apply(color: Styles.grey))
            ]),
          ],
        ),
      ),
    );
  }
}
