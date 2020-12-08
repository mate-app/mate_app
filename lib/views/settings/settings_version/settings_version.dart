import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../shared/shared.dart';
import '../../../styles/styles.dart';

class SettingsVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MateColors.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar(title: 'Versionen'),
            pinned: true,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 25, 5, 0),
                child: MarkdownBody(
                  data: '''
## Version 1.0.0

###### Winter 2020

* kostenlos für Android & iOS verfügbar
* simples, hochqualitatives Plattform-agnostisches Design
* sicheres und vertrauenswürdiges Behandeln von privaten Daten nach den Standards der DSGVO
* individueller Terminplan
  - Zum Launch werden die Fachbereiche Informatik und Medien unterstützt. Die Unterstützung weiterer Fachbereiche erfolgt automatisch ohne das es einem Update bedarf.
* Rating-System für Mensa-Gerichte
* allgemeine und fachbereichsinterne News
* Übersicht über Tage bis zu den Ferien, Studienfortschritt und Durchschnittsnote [wip]
* Einsicht der Noten aller Module [wip]

''',
                  styleSheet:
                      MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                    h2: MateTextstyles.h2,
                    p: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 15.0,
                        ),
                    h6: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 14.0,
                          color: MateColors.lightGrey,
                          backgroundColor: MateColors.white,
                          decoration: TextDecoration.none,
                        ),
                  ),
                ),
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
