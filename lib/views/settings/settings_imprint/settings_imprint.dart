import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../shared/shared.dart';
import '../../../styles/styles.dart';

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
            delegate: StaticNavigationBar(title: 'Impressum'),
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
                    child: Center(
                      child: MarkdownBody(
                        data: '''
Verantwortliche: 

**Mathis Fandré**  
Möllingstr. 20  
24103 Kiel  
mathis@mate-app.de  
  
**Ramin Nobakht**  
Knooperweg 113  
24118 Kiel  
ramin@mate-app.de  
  
**Tobias Pörtner**  
Kirchhofalle 5  
24103 Kiel  
tobias@mate-app.de  
  
Allgemeiner Kontakt:

**contact@mate-app.de**  
  
Rechtliche Anfragen:

**legal@mate-app.de**
''',
                        styleSheet:
                            MarkdownStyleSheet.fromTheme(Theme.of(context))
                                .copyWith(
                                    p: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(fontSize: 16.0)),
                      ),
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
