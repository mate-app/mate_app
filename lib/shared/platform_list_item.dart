import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../styles/styles.dart';
import 'shared.dart';

class PlatformListItem extends StatelessWidget {
  const PlatformListItem({
    Key key,
    @required this.itemIndex,
    @required this.action,
    @required this.text,
  }) : super(key: key);

  final Future
      action; // Currently only accepts futures, Navigator returns a Future so might be fine for now
  final int itemIndex;
  final String text;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      cupertino: (_, __) => Container(
        decoration: const BoxDecoration(
          color: MateColors.white,
        ),
        child: CupertinoButton(
          onPressed: () async {
            await action;
          },
          child: Row(
            children: [
              PlatformText(
                text,
                style: MateTextstyles.font.apply(
                  color: MateColors.grey,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.keyboard_arrow_right,
                color: MateColors.lightGrey,
                size: 30,
              )
            ],
          ),
        ),
      ),
      material: (_, __) => Material(
        color: MateColors.white,
        child: ListTile(
          title: DynamicText(
            text,
            style: MateTextstyles.font,
          ),
          onTap: () async {
            await action;
          },
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: MateColors.lightGrey,
            size: 30,
          ),
        ),
      ),
    );
  }
}
