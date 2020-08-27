import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/utils/utils.dart';
import 'package:mateapp/widgets/widgets.dart';
// TODO: remove import and use inheritance
import '../../styles/styles.dart';

class EinstellungDatenschutz extends StatefulWidget {
  @override
  _EinstellungDatenschutzState createState() {
    return _EinstellungDatenschutzState();
  }
}

class _EinstellungDatenschutzState extends State<EinstellungDatenschutz> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar('Datenschutz'),
            pinned: true,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            PrivacyText(
              text: 'Datenschutz',
            ),
          ])),
        ],
      ),
    );
  }
}

class PrivacyText extends StatelessWidget {
  final String text;

  //Constructor

  PrivacyText({
    Key key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(5, 25, 5, 0),
            child: Text(
              text,
              style: Styles.font.apply(color: Styles.grey),
              // textAlign: TextAlign.justify,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text('zur Webseite'),
                onPressed: () => launchURL('www.mate-app.de/datenschutz'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
