import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mateapp/views/settings/settings_account/local_widgets/local_widgets.dart';

import '../../../../models/models.dart';
import '../../../../styles/styles.dart';

class SettingsAccountProperties extends StatelessWidget {
  final UserModel user;

  const SettingsAccountProperties({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int votes = user.upvotes.length + user.downvotes.length;
    final List<SettingsAccountProperty> settingsAccountProperties = [
      SettingsAccountProperty(
        value: user.mail,
        propertyName: 'E-Mail:',
      ),
      SettingsAccountProperty(
        value: user.university,
        propertyName: 'Universität:',
      ),
      SettingsAccountProperty(
        value: user.department,
        propertyName: 'Fachbereich:',
      ),
      SettingsAccountProperty(
        value: user.subject,
        propertyName: 'Studiengang:',
      ),
      SettingsAccountProperty(
        value: votes.toString(),
        propertyName: 'Deine Mensa-Votes:',
      ),
    ];
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            child: PlatformText(
              'Account Informationen',
              style: MateTextstyles.small,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              children: <Widget>[
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) =>
                            settingsAccountProperties[index])),
                SettingsAccountVotediagram(user: user),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      color: MateColors.grey,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
