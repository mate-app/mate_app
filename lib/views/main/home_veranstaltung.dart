import 'package:flutter/cupertino.dart';

import '../../styles/styles.dart';

class HomeVeranstaltung extends StatefulWidget {
  @override
  _HomeVeranstaltungState createState() {
    return _HomeVeranstaltungState();
  }
}

class _HomeVeranstaltungState extends State<HomeVeranstaltung> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.white,
      child: const CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Veranstaltung'),
          ),
        ],
      ),
    );
  }
}
