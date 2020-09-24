import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/models.dart';
import '../../../shared/shared.dart';
import '../../../styles/styles.dart';
import 'local_widgets/local_widgets.dart';

class SettingsAccount extends StatelessWidget {
  Future<bool> _checkIfAnalyticsIsOn() async {
    final analyticsStorage = await SharedPreferences.getInstance();
    return analyticsStorage.getBool('analyticsOn');
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    return Container(
      color: MateColors.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar(title: 'Account'),
            pinned: true,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            SettingsAccountProperties(
              user: user,
            ),
            FutureBuilder<bool>(
                future: _checkIfAnalyticsIsOn(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.hasData) {
                    return SettingsAccountAnalytics(
                        isAnalyticsOn: snapshot.data);
                  }
                  if (!snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    return const SettingsAccountAnalytics(isAnalyticsOn: true);
                  }
                  return const LoadingIndicator();
                }),
          ])),
        ],
      ),
    );
  }
}
