import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../shared/shared.dart';
import '../styles/styles.dart';
import 'universities.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Column(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height / 1.35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/welcomescreen.png"),
                  fit: BoxFit.contain,
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 12.5, 30, 0),
            child: DynamicText(
              'Lege sofort los und genieße dein ganzes \nStudium in nur einer App.',
              style: MateTextstyles.font.apply(color: MateColors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * 0.6,
              child: PlatformButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      platformPageRoute(
                          context: context, builder: (_) => Universities()));
                },
                cupertinoFilled: (_, __) => CupertinoFilledButtonData(),
                material: (_, __) => MaterialRaisedButtonData(
                  shape: const RoundedRectangleBorder(
                      borderRadius: MateShapes.roundedEdges),
                  color: MateColors.primary,
                  textColor: MateColors.white,
                ),
                child: PlatformText('Loslegen'),
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
