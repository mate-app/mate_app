import 'package:flutter/cupertino.dart';

class MatePageRoute extends CupertinoPageRoute {
  final Widget page;
  MatePageRoute({this.page})
      : super(
          builder: (
            BuildContext context,
          ) =>
              page,
        );
  @override
  Color get barrierColor => super.barrierColor;

  @override
  bool get popGestureEnabled => true;

  @override
  bool get popGestureInProgress => true;

  // @override
  // Widget buildTransitions(BuildContext context, Animation<double> animation,
  //     Animation<double> secondaryAnimation, Widget child) {
  //   // TODO: implement buildTransitions
  //   return SlideTransition(
  //     position: Tween<Offset>(
  //       begin: const Offset(1, 0),
  //       end: Offset.zero,
  //     ).animate(CurvedAnimation(
  //       parent: animation,
  //       curve: Curves.easeInOut,
  //     )),
  //     child: child, // child is the value returned by pageBuilder
  //   );
  // }

  @override
  // TODO: implement opaque
  bool get opaque => true;

  @override
  // TODO: implement barrierCurve
  Curve get barrierCurve => super.barrierCurve;
}
