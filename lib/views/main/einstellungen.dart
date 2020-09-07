import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mateapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/views/main/einstellungen_code_of_cunduct.dart';
import 'package:mateapp/views/views.dart';
import 'package:mateapp/widgets/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO: remove and use inheritance instead
import '../../styles/styles.dart';

class EinstellungenTab extends StatefulWidget {
  @override
  _EinstellungenTabState createState() {
    return _EinstellungenTabState();
  }
}

class _EinstellungenTabState extends State<EinstellungenTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Einstellungen'),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [EinstellungsLinks()],
          ),
        ),
      ],
    );
  }
}

class EinstellungsLinks extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 60),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text("Allgemein", style: MateTextstyles.small),
            ),

            //Account
            SettingsListItem(
              title: 'Account',
              iconData: Icons.person,
              route: EinstellungAccount(),
            ),

            //Information
            Container(
              padding: EdgeInsets.fromLTRB(10, 35, 0, 10),
              child: Text("Information", style: MateTextstyles.small),
            ),

            //Code of Conduct
            SettingsListItem(
              title: 'Code of Conduct',
              iconData: FontAwesomeIcons.handHoldingHeart,
              route: EinstellungCode(),
            ),
            //Datenschutz
            SettingsListItem(
              title: 'Datenschutz',
              iconData: Icons.security,
              route: EinstellungDatenschutz(),
            ),

            //Impressum
            SettingsListItem(
              title: 'Impressum',
              iconData: Icons.info,
              route: EinstellungImpressum(),
            ),
            //Version
            SettingsListItem(
              title: 'Version',
              iconData: Icons.code,
              route: EinstellungVersion(),
            ),
            Container(
              color: CupertinoColors.white,
              height: 80.0,
              child: Center(
                child: CupertinoButton(
                  color: MateColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                  child: Text('logout'),
                  onPressed: () async {
                    final credentials = await SharedPreferences.getInstance();
                    credentials.remove('email');
                    credentials.remove('password');
                    await _auth.signOut();
                  },
                ),
              ),
            ),
          ]),
    );
  }
}
