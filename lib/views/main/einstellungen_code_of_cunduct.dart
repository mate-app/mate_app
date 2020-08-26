import 'package:flutter/cupertino.dart';

import '../../styles/styles.dart';

class EinstellungCode extends StatefulWidget {
  @override
  _EinstellungCodeState createState() {
    return _EinstellungCodeState();
  }
}

class _EinstellungCodeState extends State<EinstellungCode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.white,
      child: const CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Code of Conduct'),
          ),
        ],
      ),
    );
  }
}
