import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../models/models.dart';
import '../../../../services/services.dart';
import '../../../../styles/styles.dart';
import 'local_widgets.dart';

class SettingsAccountVotediagram extends StatelessWidget {
  final UserModel user;

  const SettingsAccountVotediagram({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: StreamBuilder<UserModel>(
              stream:
                  Document<UserModel>(path: "users/${user.id}").streamData(),
              builder: (context, snapshot) {
                Map<String, double> dataMap;
                if (snapshot.hasError ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  dataMap = {
                    "Upvotes": 0,
                    "Downvotes": 0,
                  };
                } else {
                  dataMap = {
                    "Upvotes": snapshot.data.upvotes.length.toDouble() ?? 0,
                    "Downvotes": snapshot.data.downvotes.length.toDouble() ?? 0,
                  };
                }

                return PieChart(
                  dataMap: dataMap,
                  animationDuration: const Duration(milliseconds: 800),
                  chartLegendSpacing: 32.0,
                  chartRadius: MediaQuery.of(context).size.width / 2.7,
                  chartValueBackgroundColor: MateColors.white,
                  colorList: const [
                    MateColors.primary,
                    MateColors.secondary,
                  ],
                  showLegends: false,
                  chartValueStyle: defaultChartValueStyle.copyWith(
                    color: MateColors.white,
                  ),
                );
              }),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SettingsAccountVotediagramLegend(
                color: MateColors.primary,
                title: 'Upvotes',
              ),
              SettingsAccountVotediagramLegend(
                color: MateColors.secondary,
                title: 'Downvotes',
              ),
            ],
          ),
        )
      ],
    );
  }
}
