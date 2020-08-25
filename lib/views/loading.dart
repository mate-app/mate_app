import 'package:flutter/cupertino.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        child: Center(
          child: CupertinoActivityIndicator()
        ),
      ),
    );
  }
}