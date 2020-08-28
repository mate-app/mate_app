import 'package:flutter/cupertino.dart';
import 'package:mateapp/widgets/widgets.dart';
import '../../styles/styles.dart';

class EinstellungVersion extends StatefulWidget {
  @override
  _EinstellungVersionState createState() {
    return _EinstellungVersionState();
  }
}

class _EinstellungVersionState extends State<EinstellungVersion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar('Versionen'),
            pinned: true,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            VersionReport(
              versionNumber: "Version 1.0 release",
              releaseDate: 'September 15, 2020',
              text:
                  "Die erste Version von mate. Sie wird durch die Decke gehen und alle Student*innen lieben uns dafür lieben.",
            ),
          ])),
        ],
      ),
    );
  }
}

class VersionReport extends StatelessWidget {
  final String versionNumber;
  final String releaseDate;
  final String text;

  // Constructor
  VersionReport({
    Key key,
    this.versionNumber,
    this.releaseDate,
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
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Text(
              versionNumber,
              style: Styles.h2.apply(color: Styles.grey),
              // textAlign: TextAlign.justify,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
            child: Text(
              releaseDate,
              style: Styles.small.apply(color: Styles.grey),
              // textAlign: TextAlign.justify,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: Text(
              text,
              style: Styles.font.apply(color: Styles.grey),
              // textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
