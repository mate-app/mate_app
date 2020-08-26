import 'package:flutter/cupertino.dart';

import '../../styles/styles.dart';

class EinstellungVersion extends StatefulWidget {
  @override
  _EinstellungVersionState createState() {
    return _EinstellungVersionState();
  }
}

class _EinstellungVersionState extends State<EinstellungVersion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.white,
      child: const CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Version'),
          ),
        ],
      ),
    );
  }
}
