import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../styles/styles.dart';

class OrganisationListItem extends StatelessWidget {
  final Widget page;
  final String title;

  const OrganisationListItem({
    Key key,
    this.page,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformButton(
      onPressed: () {
        Navigator.push(
            context, platformPageRoute(context: context, builder: (_) => page));
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
        child: Row(children: <Widget>[
          PlatformText(
            title,
            style: MateTextstyles.font.apply(color: MateColors.grey),
          ),
          const Spacer(),
          const Icon(
            Icons.keyboard_arrow_right,
            color: MateColors.grey,
            size: 20.0,
          ),
        ]),
      ),
    );
  }
}
