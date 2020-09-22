import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../shared/widgets.dart';
import '../styles/colors.dart';
import '../styles/styles.dart';

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          child: Center(
            child: DynamicText(
              'Nichts zu sehen? Melde dich kostenlos an, um alle Funktionen nutzen zu können',
              style: MateTextstyles.font,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          height: 60,
          child: Center(
            child: PlatformButton(
              color: MateColors.primary,
              onPressed: () => null,
              cupertinoFilled: (_, __) => CupertinoFilledButtonData(),
              child: PlatformText('Registrieren'),
            ),
          ),
        ),
      ],
    );
  }
}
