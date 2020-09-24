import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../styles/colors.dart';
import '../styles/styles.dart';
import '../views/full_setup/subjects.dart';
import 'shared.dart';

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    return Column(
      children: [
        Container(
          height: 60,
          child: Center(
            child: DynamicText(
              'Melde dich kostenlos an, um mate im vollen Funktionsumfang nutzen zu können',
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
              onPressed: () => Navigator.of(context, rootNavigator: true).push(
                  platformPageRoute(
                      context: context, builder: (_) => Subjects(user: user))),
              cupertinoFilled: (_, __) => CupertinoFilledButtonData(),
              child: PlatformText('Registrieren'),
            ),
          ),
        ),
      ],
    );
  }
}
