import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mateapp/styles/styles.dart';
import 'package:mateapp/shared/widgets.dart';

import '../settings_codeofconduct/settings_codeofconduct.dart';
import '../settings_imprint/settings_imprint.dart';
import '../settings_privacy/settings_privacy.dart';
import '../settings_version/settings_version.dart';
import 'local_widgets.dart';

class SettingsListInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 60),
      child: Column(
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
            title: 'Code of Conduct',
            iconData: FontAwesomeIcons.handHoldingHeart,
            route: SettingsCodeofconduct(),
          ),
          SettingsListItem(
            title: 'Datenschutz',
            iconData: Icons.security,
            route: SettingsPrivacy(),
          ),
          SettingsListItem(
            title: 'Impressum',
            iconData: Icons.info,
            route: SettingsImprint(),
          ),
          SettingsListItem(
            title: 'Version',
            iconData: Icons.code,
            route: SettingsVersion(),
          ),
        ],
      ),
    );
  }
}
