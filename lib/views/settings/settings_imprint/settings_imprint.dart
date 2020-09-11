import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mateapp/styles/styles.dart';
import 'package:mateapp/widgets/widgets.dart';

class SettingsImprint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MateColors.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar(title: 'Mitteilung'),
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
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/welcomescreen.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(5, 25, 5, 0),
                    child: PlatformText(
                      '''
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
                      style: MateTextstyles.font.apply(color: MateColors.grey),
                      // textAlign: TextAlign.justify,
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
