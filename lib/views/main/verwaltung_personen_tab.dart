import 'package:flutter/cupertino.dart';

class VerwaltungPersonen extends StatefulWidget {
  @override
  _VerwaltungPersonenState createState() {
    return _VerwaltungPersonenState();
  }
}

class _VerwaltungPersonenState extends State<VerwaltungPersonen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Personen'),
        ),
      ],
    );
  }
}
