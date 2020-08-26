import 'package:flutter/cupertino.dart';

import '../../styles/styles.dart';

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
    return Container(
      color: Styles.white,
      child: const CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Prüfungsordnung'),
          ),
        ],
      ),
    );
  }
}
