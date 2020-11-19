import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../styles/styles.dart';

class SettingsAccountAnalytics extends StatefulWidget {
  final bool isAnalyticsOn;

  const SettingsAccountAnalytics({Key key, this.isAnalyticsOn})
      : super(key: key);

  @override
  _SettingsAccountAnalyticsState createState() =>
      _SettingsAccountAnalyticsState();
}

class _SettingsAccountAnalyticsState extends State<SettingsAccountAnalytics> {
  bool isAnalyticsOn;

  @override
  void initState() {
    super.initState();
    isAnalyticsOn = widget.isAnalyticsOn;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 50, 0, 10),
            child: Text(
              'Datenschutz Einstellungen',
              style: MateTextstyles.small,
            ),
          ),
          Material(
            color: MateColors.white,
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                children: [
                  Text(
                    'Analyse Aktivieren',
                    style: MateTextstyles.font
                        .apply(color: MateColors.grey, fontWeightDelta: 2),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  PlatformSwitch(
                    cupertino: (_, __) => CupertinoSwitchData(
                      activeColor: MateColors.primary,
                    ),
                    material: (_, __) => MaterialSwitchData(
                      activeColor: MateColors.primary,
                    ),
                    value: isAnalyticsOn ?? false,
                    onChanged: (bool value) async {
                      final analyticsStorage =
                          await SharedPreferences.getInstance();
                      await analyticsStorage.setBool(
                          'analyticsOn', !isAnalyticsOn ?? false);
                      setState(() {
                        isAnalyticsOn = !isAnalyticsOn ?? false;
                      });
                      FirebaseAnalytics()
                          .setAnalyticsCollectionEnabled(isAnalyticsOn);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
