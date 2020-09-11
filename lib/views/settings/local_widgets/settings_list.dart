import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mateapp/views/settings/settings_account/settings_account.dart';
import 'package:mateapp/views/settings/settings_codeofconduct/settings_codeofconduct.dart';
import 'package:mateapp/views/settings/settings_imprint/settings_imprint.dart';
import 'package:mateapp/views/settings/settings_privacy/settings_privacy.dart';
import 'package:mateapp/views/settings/settings_version/settings_version.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/services.dart';
import '../../../styles/styles.dart';
import 'settings_list_item.dart';

class SettingsList extends StatelessWidget {
  final AuthService _auth = AuthService();

  static final generalItems = [
    SettingsListItem(
      title: 'Account',
      iconData: Icons.person,
      route: SettingsAccount(),
    ),
  ];
  static final informationItems = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 60),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Allgemein
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: PlatformText("Allgemein", style: MateTextstyles.small),
            ),

            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => generalItems[index])),

            //Information
            Container(
              padding: const EdgeInsets.fromLTRB(10, 35, 0, 10),
              child: PlatformText("Information", style: MateTextstyles.small),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) =>
                        informationItems[index])),
            Container(
              color: MateColors.white,
              height: 80.0,
              child: Center(
                child: PlatformButton(
                  color: MateColors.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  onPressed: () async {
                    final credentials = await SharedPreferences.getInstance();
                    credentials.remove('email');
                    credentials.remove('password');
                    await _auth.signOut();
                  },
                  child: PlatformText('logout'),
                ),
              ),
            ),
          ]),
    );
  }
}
