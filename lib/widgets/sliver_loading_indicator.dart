import 'package:flutter/cupertino.dart';

class SliverLoadingIndicator extends StatelessWidget {
  const SliverLoadingIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        child: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
