import 'package:flutter/cupertino.dart';

class EinstellungAccount extends StatefulWidget {
  @override
  _EinstellungAccountState createState() {
    return _EinstellungAccountState();
  }
}

class _EinstellungAccountState extends State<EinstellungAccount> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Account'),
        ),
      ],
    );
  }
}
