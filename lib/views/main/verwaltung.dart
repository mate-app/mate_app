import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/views/views.dart';

// TODO: remove import and use inheritance
import '../../styles/styles.dart';

class VerwaltungTab extends StatefulWidget {
  @override
  _VerwaltungTabState createState() {
    return _VerwaltungTabState();
  }
}

class _VerwaltungTabState extends State<VerwaltungTab> {
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: const Text('Verwaltung'),
        ),
        SliverList(
            delegate: SliverChildListDelegate(
                [VerwaltungsPanel(user: user), VerwaltungsLinks()]))
      ],
    );
  }
}

class VerwaltungsPanel extends StatelessWidget {
  final UserModel user;

  // Constructor
  VerwaltungsPanel({
    Key key,
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    var userPercent = (170 / user.credits) * 100;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          Styles.boxShadow,
        ],
        borderRadius: Styles.roundedEdges,
        gradient: Styles.gradientPrimary,
      ),
      height: 210,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(children: <Widget>[
            //Tage bis zu den Ferien
            Container(
              margin: EdgeInsets.fromLTRB(10, 25, 10, 10),
              height: MediaQuery.of(context).size.width * 0.18,
              width: MediaQuery.of(context).size.width * 0.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.18,
                ),
                border: Border.all(
                  color: Styles.white,
                  width: 3.0,
                ),
              ),
              child: Center(
                  child: Text("",
                      style: Styles.font
                          .apply(color: Styles.grey, fontWeightDelta: 2))),
            ),
            Container(
                constraints: BoxConstraints(
                  minWidth: 50,
                  maxWidth: MediaQuery.of(context).size.width * 0.20,
                ),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                alignment: const Alignment(0.0, 1.0),
                child: Text(
                  "Tage bis zu den Ferien",
                  style: Styles.font.apply(color: Styles.white),
                  textAlign: TextAlign.center,
                )),
          ]),

          // Fortschritt
          Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.width * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.25,
                ),
                border: Border.all(
                  color: Styles.white,
                  width: 3.0,
                ),
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [
                    0.0,
                    (170 / user.credits),
                    (170 / user.credits) + 0.001
                  ],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Styles.white,
                    Styles.white,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Center(
                child: Text(userPercent.toString(),
                    style: Styles.h2.apply(color: Styles.grey)),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              constraints: BoxConstraints(
                minWidth: 86,
                maxWidth: MediaQuery.of(context).size.width * 0.28,
              ),
              child: Text(
                'Fortschritt $userPercent%',
                style: Styles.h2.apply(color: Styles.white),
                textAlign: TextAlign.center,
              ),
            ),
          ]),

          //Notenschnitt
          Column(children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 25, 10, 10),
              height: MediaQuery.of(context).size.width * 0.18,
              width: MediaQuery.of(context).size.width * 0.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.18,
                ),
                border: Border.all(
                  color: Styles.white,
                  width: 3.0,
                ),
              ),
              child: Center(
                  child: Text(user.average.toString(),
                      style: Styles.font
                          .apply(color: Styles.grey, fontWeightDelta: 2))),
            ),
            Container(
                constraints: BoxConstraints(
                  minWidth: 50,
                  maxWidth: MediaQuery.of(context).size.width * 0.20,
                ),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                alignment: const Alignment(0.0, 1.0),
                child: Text(
                  "Dein Schnitt",
                  style: Styles.font.apply(color: Styles.white),
                  textAlign: TextAlign.center,
                )),
          ]),
        ],
      ),
    );
  }
}

class VerwaltungsLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 60),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Essential Links
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
              width: 380,
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  width: 1.0,
                  color: Styles.grey,
                )),
              ),
              child: Text("Essential Links", style: Styles.small),
            ),

            // //Meine Module
            // CupertinoButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       CupertinoPageRoute(builder: (context) {
            //         return VerwaltungModule();
            //       }),
            //     );
            //   },
            //   child: Container(
            //     padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
            //     child: Row(children: <Widget>[
            //       Text(
            //         "Meine Module",
            //         style: Styles.font.apply(color: Styles.grey),
            //       ),
            //       Spacer(),
            //       Icon(
            //         Icons.keyboard_arrow_right,
            //         color: Styles.grey,
            //         size: 20.0,
            //       ),
            //     ]),
            //   ),
            // ),

            // //Personen
            // CupertinoButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       CupertinoPageRoute(builder: (context) {
            //         return VerwaltungPersonen();
            //       }),
            //     );
            //   },
            //   child: Container(
            //     padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
            //     child: Row(children: <Widget>[
            //       Text(
            //         "Personen",
            //         style: Styles.font.apply(color: Styles.grey),
            //       ),
            //       Spacer(),
            //       Icon(
            //         Icons.keyboard_arrow_right,
            //         color: Styles.grey,
            //         size: 20.0,
            //       ),
            //     ]),
            //   ),
            // ),

            //Notenübersicht
            CupertinoButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) {
                    return VerwaltungNoten();
                  }),
                );
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: Row(children: <Widget>[
                  Text(
                    "Notenübersicht",
                    style: Styles.font.apply(color: Styles.grey),
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Styles.grey,
                    size: 20.0,
                  ),
                ]),
              ),
            ),

            //Prüfungsordnung
            CupertinoButton(
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(builder: (context) {
                    return VerwaltungPruefungsOrdnung();
                  }),
                );
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: Row(children: <Widget>[
                  Text(
                    "Prüfungsordnung",
                    style: Styles.font.apply(color: Styles.grey),
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Styles.grey,
                    size: 20.0,
                  ),
                ]),
              ),
            ),
          ]),
    );
  }
}
