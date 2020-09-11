import 'package:flutter/material.dart';

import '../../../../styles/styles.dart';

class SettingsAccountProperty extends StatelessWidget {
  final String propertyName;
  final String value;

  const SettingsAccountProperty({Key key, this.propertyName, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Row(
        children: <Widget>[
          Text(propertyName,
              style: MateTextstyles.font
                  .apply(color: MateColors.grey, fontWeightDelta: 2)),
          const Spacer(
            flex: 2,
          ),
          Text(value, style: MateTextstyles.font.apply(color: MateColors.grey))
        ],
      ),
    );
  }
}
