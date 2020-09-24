import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../../../styles/styles.dart';
import '../settings_account/settings_account.dart';
import 'local_widgets.dart';

class SettingsListGeneral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            width: 380,
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: MateColors.grey,
              )),
            ),
            child: DynamicText("Allgemein", style: MateTextstyles.small),
          ),
          SettingsListItem(
            title: 'Account',
            iconData: Icons.person,
            route: SettingsAccount(),
          ),
        ],
      ),
    );
  }
}
