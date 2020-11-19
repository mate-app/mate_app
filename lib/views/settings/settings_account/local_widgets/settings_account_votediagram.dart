import 'package:flutter/material.dart';
import 'package:mateapp/views/settings/settings_account/local_widgets/local_widgets.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../models/models.dart';
import '../../../../styles/styles.dart';

class SettingsAccountVotediagram extends StatefulWidget {
  const SettingsAccountVotediagram({
    Key key,
    @required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  _SettingsAccountVotediagramState createState() =>
      _SettingsAccountVotediagramState();
}

class _SettingsAccountVotediagramState
    extends State<SettingsAccountVotediagram> {
  Map<String, double> dataMap = {
    "Upvotes": 0,
    "Downvotes": 0,
  };

  @override
  void initState() {
    super.initState();
    dataMap["Upvotes"] =
        widget.user.upvotes.isEmpty ? 0 : widget.user.upvotes.length.toDouble();
    dataMap["Downvotes"] = widget.user.downvotes.isEmpty
        ? 0
        : widget.user.downvotes.length.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: PieChart(
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
          ),
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
