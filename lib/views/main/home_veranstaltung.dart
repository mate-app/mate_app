import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/utils/utils.dart';
import 'package:mateapp/widgets/widgets.dart';
// TODO: remove import and use inheritance
import '../../styles/styles.dart';

class HomeVeranstaltung extends StatefulWidget {
  final Event event;

  //Constructor
  HomeVeranstaltung({Key key, @required this.event}) : super(key: key);

  @override
  _HomeVeranstaltungState createState() => _HomeVeranstaltungState();
}

class _HomeVeranstaltungState extends State<HomeVeranstaltung> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar('Mitteilung'),
            pinned: true,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            EventDetailPanel(
              event: widget.event,
            ),
            EventDetailText(
              event: widget.event,
            )
          ])),
        ],
      ),
    );
  }
}

class EventDetailPanel extends StatelessWidget {
  final Event event;

  // Constructor
  EventDetailPanel({
    Key key,
    this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: Styles.roundedEdges,
        gradient: Styles.eventGradient[event.getType],
      ),
      height: 160,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(event.courseName,
                style: Styles.h1.apply(color: Styles.white)),
          ),
          Spacer(
            flex: 1,
          ),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
                child: Text(
                  convertDateToString(event.date),
                  style: Styles.font.apply(
                    color: Styles.white,
                    fontWeightDelta: 2,
                  ),
                ),
              ),
              Text(
                event.getStartsAt + ' - ' + event.getEndsAt,
                style: Styles.font.apply(
                  color: Styles.white,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class EventDetailText extends StatelessWidget {
  final Event event;

  // Constructor
  EventDetailText({
    Key key,
    this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Essential Links

          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                width: 1.0,
                color: Styles.grey,
              )),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  'Veranstaltungsart',
                  style: Styles.small.apply(
                    color: Styles.grey,
                  ),
                ),
                Spacer(),
                Text(event.type,
                    style: Styles.small.apply(
                      color: Styles.eventColor[event.getType],
                    )),
              ],
            ),
          ),

          // Dozent*in
          EventListItem(
            event: event.lecturers.join(', '),
            title: 'Dozierend in diesem Modul',
          ),

          // Ort
          EventListItem(
            event: event.location,
            title: 'Ort',
          ),

          // Schwerpunkt
          event.major != ""
              ? EventListItem(
                  event: event.major,
                  title: 'Schwerpunkt',
                )
              : Container(),

          // Gruppen
          event.groups.length > 0
              ? EventListItem(
                  event: event.groups.join(', '),
                  title: 'Gruppe',
                )
              : Container(),
        ],
      ),
    );
  }
}

class EventListItem extends StatelessWidget {
  const EventListItem({
    Key key,
    @required this.event,
    this.title,
  }) : super(key: key);

  final String event;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Row(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Styles.font.apply(
                    color: Styles.grey,
                  ),
                ),
                Text(event,
                    style: Styles.font
                        .apply(color: Styles.grey, fontWeightDelta: 2)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
