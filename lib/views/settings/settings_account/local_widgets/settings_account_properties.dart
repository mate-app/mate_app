import 'package:flutter/material.dart';

import '../../../../models/models.dart';
import '../../../../styles/styles.dart';
import 'local_widgets.dart';

class SettingsAccountProperties extends StatelessWidget {
  final UserModel user;

  const SettingsAccountProperties({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int votes = user.upvotes.length + user.downvotes.length;
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            child: const Text(
              'Account Informationen',
              style: MateTextstyles.small,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              children: <Widget>[
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
