import 'package:flutter/cupertino.dart';

import '../../styles/styles.dart';

class VerwaltungNoten extends StatefulWidget {
  @override
  _VerwaltungNotenState createState() {
    return _VerwaltungNotenState();
  }
}

class _VerwaltungNotenState extends State<VerwaltungNoten> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.white,
      child: const CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Notenübersicht'),
          ),
        ],
      ),
    );
  }
}
