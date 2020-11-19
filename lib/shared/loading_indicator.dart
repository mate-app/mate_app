import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../styles/styles.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Center(
        child: Theme(
          data: Theme.of(context).copyWith(accentColor: MateColors.secondary),
          child: PlatformCircularProgressIndicator(
            material: (_, __) => MaterialProgressIndicatorData(
                backgroundColor: MateColors.primary),
          ),
        ),
      ),
    );
  }
}
