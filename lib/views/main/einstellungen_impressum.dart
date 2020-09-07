import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:mateapp/widgets/widgets.dart';
// TODO: remove import and use inheritance
import '../../styles/styles.dart';

class EinstellungImpressum extends StatefulWidget {
  @override
  _EinstellungImpressumState createState() {
    return _EinstellungImpressumState();
  }
}

class _EinstellungImpressumState extends State<EinstellungImpressum> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MateColors.white,
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
            AppNotesText(
              text: '''
Verantwortliche: 

Mathis Fandré
Möllingstr. 20
24103 Kiel

Ramin Nobakht
Knooperweg 113
24118 Kiel

Tobias Pörtner
Kirchhofalle 5
24103 Kiel

Kontakt:

E-Mail: contact @ mate-app.de

Für anfragen bezüglich Datenschutz und Recht:

legal @ mate-app.de
''',
            ),
          ])),
        ],
      ),
    );
  }
}

class AppNotesText extends StatelessWidget {
  final String text;

  // Constructor
  AppNotesText({
    Key key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              height: size.height / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/welcomescreen.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(5, 25, 5, 0),
            child: Text(
              text,
              style: MateTextstyles.font.apply(color: MateColors.grey),
              // textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
