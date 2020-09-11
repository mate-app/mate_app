import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../styles/styles.dart';

class SettingsListItem extends StatefulWidget {
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
  _SettingsListItemState createState() => _SettingsListItemState();
}

class _SettingsListItemState extends State<SettingsListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: MateColors.grey,
        )),
      ),
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: CupertinoButton(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        onPressed: () {
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) {
              return widget.route;
            }),
          );
        },
        child: Row(children: <Widget>[
          Icon(
            widget.iconData ?? Icons.brightness_1,
            color: MateColors.grey,
            size: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              widget.title,
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
      ),
    );
  }
}
