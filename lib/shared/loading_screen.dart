import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../styles/styles.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      home: PlatformScaffold(
        body: Center(
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: MateColors.white),
            child: PlatformCircularProgressIndicator(
              material: (_, __) => MaterialProgressIndicatorData(
                  backgroundColor: MateColors.primary),
            ),
          ),
        ),
      ),
    );
  }
}
