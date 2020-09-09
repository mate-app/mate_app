import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaticNavigationBar extends SliverPersistentHeaderDelegate {
  String title;

  StaticNavigationBar(this.title);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return CupertinoNavigationBar(
      middle: Text(
        title,
        style: const TextStyle(
          fontSize: 15.5,
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
