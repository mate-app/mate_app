import 'package:flutter/material.dart';
import 'package:mateapp/styles/styles.dart';
import 'package:mateapp/views/settings/settings_account/local_widgets/local_widgets.dart';
import 'package:mateapp/shared/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsAccount extends StatelessWidget {
  Future<bool> _checkIfAnalyticsIsOn() async {
    final analyticsStorage = await SharedPreferences.getInstance();
    return analyticsStorage.getBool('analyticsOn');
  }

  @override
  Widget build(BuildContext context) {
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
            const SettingsAccountProperties(),
            FutureBuilder<bool>(
                future: _checkIfAnalyticsIsOn(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.hasData) {
                    return SettingsAccountAnalytics(
                        isAnalyticsOn: snapshot.data);
                  }
                  return const SliverLoadingIndicator();
                }),
          ])),
        ],
      ),
    );
  }
}
