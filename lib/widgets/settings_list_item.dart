import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// TODO: remove import use inheritance
import '../styles/styles.dart';

class SettingsListItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final route;
  const SettingsListItem({
    Key key,
    this.title,
    this.iconData,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          width: 1.0,
          color: Styles.grey,
        )),
      ),
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: CupertinoButton(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        onPressed: () {
          Navigator.of(context).push(
            CupertinoPageRoute(builder: (context) {
              return route;
            }),
          );
        },
        child: Row(children: <Widget>[
          Icon(
            iconData,
            color: Styles.grey,
            size: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              title,
              style: Styles.font.apply(color: Styles.grey),
            ),
          ),
          Spacer(),
          Icon(
            Icons.keyboard_arrow_right,
            color: Styles.grey,
            size: 15.0,
          ),
        ]),
      ),
    );
  }
}
