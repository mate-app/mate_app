import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mateapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/views/main/einstellungen_code_of_cunduct.dart';
import 'package:mateapp/views/views.dart';
import 'dart:math' as math;

// TODO: remove and use inheritance instead
import '../../styles/styles.dart';

class EinstellungenTab extends StatefulWidget {
  @override
  _EinstellungenTabState createState() {
    return _EinstellungenTabState();
  }
}

class _EinstellungenTabState extends State<EinstellungenTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Einstellungen'),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [EinstellungsLinks()],
          ),
        ),
      ],
    );
  }
}

class EinstellungsLinks extends StatelessWidget {
  final AuthService _auth = AuthService();
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
              child: Text("Allgemein", style: Styles.small),
            ),

            //Account
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  width: 1.0,
                  color: Styles.grey,
                )),
              ),
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: CupertinoButton(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) {
                      return EinstellungAccount();
                    }),
                  );
                },
                child: Row(children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Styles.grey,
                    size: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "Account",
                      style: Styles.font.apply(color: Styles.grey),
                    ),
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

            //Code of Conduct
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  width: 1.0,
                  color: Styles.grey,
                )),
              ),
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: CupertinoButton(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) {
                      return EinstellungCode();
                    }),
                  );
                },
                child: Row(children: <Widget>[
                  Icon(
                    FontAwesomeIcons.handHoldingHeart,
                    color: Styles.grey,
                    size: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "Code of Conduct",
                      style: Styles.font.apply(color: Styles.grey),
                    ),
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

            //Datenschutz
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  width: 1.0,
                  color: Styles.grey,
                )),
              ),
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: CupertinoButton(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) {
                      return EinstellungDatenschutz();
                    }),
                  );
                },
                child: Row(children: <Widget>[
                  Icon(
                    Icons.security,
                    color: Styles.grey,
                    size: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "Datenschutz",
                      style: Styles.font.apply(color: Styles.grey),
                    ),
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

            //Impressum
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  width: 1.0,
                  color: Styles.grey,
                )),
              ),
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: CupertinoButton(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) {
                      return EinstellungImpressum();
                    }),
                  );
                },
                child: Row(children: <Widget>[
                  Icon(
                    Icons.info,
                    color: Styles.grey,
                    size: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "Impressum",
                      style: Styles.font.apply(color: Styles.grey),
                    ),
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

            //Version
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  width: 1.0,
                  color: Styles.grey,
                )),
              ),
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: CupertinoButton(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                onPressed: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) {
                      return EinstellungVersion();
                    }),
                  );
                },
                child: Row(children: <Widget>[
                  Icon(
                    Icons.code,
                    color: Styles.grey,
                    size: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "Version",
                      style: Styles.font.apply(color: Styles.grey),
                    ),
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

            Container(
              color: CupertinoColors.white,
              height: 80.0,
              child: Center(
                child: CupertinoButton(
                  color: Styles.primary,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                  child: Text('logout'),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                ),
              ),
            ),
          ]),
    );
  }
}
