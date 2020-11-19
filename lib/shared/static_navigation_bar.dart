import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../styles/styles.dart';

class StaticNavigationBar extends SliverPersistentHeaderDelegate {
  String title;

  StaticNavigationBar({
    this.title,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return PlatformAppBar(
      material: (_, __) => MaterialAppBarData(
        backgroundColor: MateColors.white,
        iconTheme: const IconThemeData(
          color: MateColors.primary,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: Platform.isAndroid ? 20 : 15.5,
          color: MateColors.black,
        ),
      ),
    );
  }

  @override
  double get maxExtent => 88.0;

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
