import 'package:flutter/cupertino.dart';

class EinstellungDatenschutz extends StatefulWidget {
  @override
  _EinstellungDatenschutzState createState() {
    return _EinstellungDatenschutzState();
  }
}

class _EinstellungDatenschutzState extends State<EinstellungDatenschutz> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Datenschutz'),
        ),
      ],
    );
  }
}
