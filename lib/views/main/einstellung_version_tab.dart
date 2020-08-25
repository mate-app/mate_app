import 'package:flutter/cupertino.dart';

class EinstellungVersion extends StatefulWidget {
  @override
  _EinstellungVersionState createState() {
    return _EinstellungVersionState();
  }
}

class _EinstellungVersionState extends State<EinstellungVersion> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Version'),
        ),
      ],
    );
  }
}
