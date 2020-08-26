import 'package:flutter/cupertino.dart';

import '../../styles/styles.dart';

class EinstellungDatenschutz extends StatefulWidget {
  @override
  _EinstellungDatenschutzState createState() {
    return _EinstellungDatenschutzState();
  }
}

class _EinstellungDatenschutzState extends State<EinstellungDatenschutz> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.white,
      child: const CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Datenschutz'),
          ),
        ],
      ),
    );
  }
}
