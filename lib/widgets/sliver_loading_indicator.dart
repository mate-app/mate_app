import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SliverLoadingIndicator extends StatelessWidget {
  const SliverLoadingIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 50,
        child: Center(
          child: PlatformCircularProgressIndicator(),
        ),
      ),
    );
  }
}
