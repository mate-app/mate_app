import 'package:flutter/cupertino.dart';
import 'package:mateapp/views/main/home_veranstaltung_tab.dart';
import '../../styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/models/home.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: const Text('Home'),
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

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0,
      width: 0,
    );
    // final event = Provider.of<List<Event>>(context);

    // return SliverList(
    //   delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
    //     return HomeDay(event: event[index]);
    //   }, childCount: event?.length ?? 0),
    // );
  }
}

class HomeDay extends StatelessWidget {
  final Event event;

  // Constructor
  HomeDay({Key key, this.event});

  List _buildHomeEventList() {
    List<Widget> homeItem = List();
    for (int i = 0; i < event.count; i++) {
      homeItem.add(new HomeDate());

      for (int i = 0; i < event.count; i++) {
        homeItem.add(new HomeAppointments());
      }
    }
    homeItem.add(new Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 60)));
    return homeItem;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Home'),
        ),
        SliverList(delegate: SliverChildListDelegate(_buildHomeEventList())),
      ],
    );
  }
}

//Creates the Home List
class HomeDate extends StatelessWidget {
  /// Creates the top of each List with the Related Date [homeDate]
  ///

  final Event event;

  //Constructor
  HomeDate({
    Key key,
    this.event,
  });

  @override
  Widget build(BuildContext context) {
    if (event.date == "2020, 08, 06") {
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
        child: Text(event.date,
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
        child: Text(event.date,
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
              Text(event.start, style: Styles.small.apply(color: Styles.grey)),
              Padding(padding: EdgeInsetsDirectional.only(top: 5)),
              Text(event.end,
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
                      event.name,
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
