import 'package:flutter/cupertino.dart';

import '../../styles/styles.dart';

class EinstellungAccount extends StatefulWidget {
  @override
  _EinstellungAccountState createState() {
    return _EinstellungAccountState();
  }
}

class _EinstellungAccountState extends State<EinstellungAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.white,
      child: const CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Account'),
          ),
        ],
      ),
    );
  }
}
