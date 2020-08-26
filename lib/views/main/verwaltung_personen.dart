import 'package:flutter/cupertino.dart';

import '../../styles/styles.dart';

class VerwaltungPersonen extends StatefulWidget {
  @override
  _VerwaltungPersonenState createState() {
    return _VerwaltungPersonenState();
  }
}

class _VerwaltungPersonenState extends State<VerwaltungPersonen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.white,
      child: const CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Personen'),
          ),
        ],
      ),
    );
  }
}
