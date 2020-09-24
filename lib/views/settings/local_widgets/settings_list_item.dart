import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../styles/styles.dart';

class SettingsListItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Widget route;

  const SettingsListItem({
    Key key,
    this.title,
    this.iconData,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformButton(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      onPressed: () {
        Navigator.push(
          context,
          platformPageRoute(context: context, builder: (_) => route),
        );
      },
      child: Row(children: <Widget>[
        Icon(
          iconData ?? Icons.brightness_1,
          color: MateColors.grey,
          size: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: PlatformText(
            title,
            style: MateTextstyles.font.apply(color: MateColors.grey),
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.keyboard_arrow_right,
          color: MateColors.grey,
          size: 15.0,
        ),
      ]),
    );
  }
}
