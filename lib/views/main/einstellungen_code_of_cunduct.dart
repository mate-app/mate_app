import 'package:flutter/cupertino.dart';
import 'package:mateapp/widgets/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../styles/styles.dart';

class EinstellungCode extends StatefulWidget {
  @override
  _EinstellungCodeState createState() {
    return _EinstellungCodeState();
  }
}

class _EinstellungCodeState extends State<EinstellungCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MateColors.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar('Code of Cunduct'),
            pinned: true,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            CodeText(
              text:
                  '''## Die folgenden Punkte bilden die Grundlage unseres Handelns

Wir beziehen Position:  
1. Für den uneingeschränkten Zugang zu Bildung für alle — Deshalb ist Mate für Student*Innen kostenlos  
2. Für die volle soziale, ökonomische Teilhabe aller Menschen.  
3. Für den Erhalt des Planeten für gegenwärtige und künftige Generationen und den Erhalt der Artenvielfalt. – Deswegen setzen wir bei unserer technischen Infrastruktur auf Strom aus erneuerbaren Energien.  
4. Für das Recht, selbstbestimmt über Daten zur eigenen Person zu entscheiden – Deshalb bieten wir an, über den Support jederzeit alle Nutzerdaten einzusehen und löschen zu lassen.  
5. Gegen jede Form von Menschenfeindlichkeit.   
  
Dafür setzen wir uns ein und diese Positionen sind nicht verhandelbar.
''',
            ),
          ])),
        ],
      ),
    );
  }
}

class CodeText extends StatelessWidget {
  final String text;

  // Constructor
  CodeText({
    Key key,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: MarkdownBody(data: text),
          ),
        ],
      ),
    );
  }
}
