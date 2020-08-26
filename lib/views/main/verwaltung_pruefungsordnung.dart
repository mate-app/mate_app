import 'package:flutter/cupertino.dart';

class VerwaltungPruefungsOrdnung extends StatefulWidget {
  @override
  _VerwaltungPruefungsOrdnungState createState() {
    return _VerwaltungPruefungsOrdnungState();
  }
}

class _VerwaltungPruefungsOrdnungState
    extends State<VerwaltungPruefungsOrdnung> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Prüfungsordnung'),
        ),
      ],
    );
  }
}
