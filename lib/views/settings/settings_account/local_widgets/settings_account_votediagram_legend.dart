import 'package:flutter/material.dart';

import '../../../../styles/styles.dart';

class SettingsAccountVotediagramLegend extends StatelessWidget {
  final String title;
  final Color color;

  const SettingsAccountVotediagramLegend({Key key, this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 15,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: color,
            ),
          ),
          Text(
            title,
            style: MateTextstyles.small.apply(color: MateColors.grey),
          ),
        ],
      ),
    );
  }
}
