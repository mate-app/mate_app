import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../shared/shared.dart';
import '../../../styles/styles.dart';

class SettingsCodeofconduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MateColors.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar(title: 'Code of Cunduct'),
            pinned: true,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                    child: const MarkdownBody(
                      data: '''
                          ## Die folgenden Punkte bilden die Grundlage unseres Handelns

                          Wir beziehen Position:  
                          1. Für den uneingeschränkten Zugang zu Bildung für alle — Deshalb ist Mate für Student*Innen kostenlos  
                          2. Für die volle soziale, ökonomische Teilhabe aller Menschen.  
                          3. Für den Erhalt des Planeten für gegenwärtige und künftige Generationen und den Erhalt der Artenvielfalt. – Deswegen setzen wir bei unserer technischen Infrastruktur auf Strom aus erneuerbaren Energien.  
                          4. Für das Recht, selbstbestimmt über Daten zur eigenen Person zu entscheiden – Deshalb bieten wir an, über den Support jederzeit alle Nutzerdaten einzusehen und löschen zu lassen.  
                          5. Gegen jede Form von Menschenfeindlichkeit.   
                            
                          Dafür setzen wir uns ein und diese Positionen sind nicht verhandelbar.
                          ''',
                    ),
                  ),
                ],
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
