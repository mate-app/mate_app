import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/models/models.dart';

class StaticNavigationBar extends SliverPersistentHeaderDelegate {
  String title;

  StaticNavigationBar(this.title);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: CupertinoNavigationBar(
        middle: Container(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15.5,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 64.0;

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
