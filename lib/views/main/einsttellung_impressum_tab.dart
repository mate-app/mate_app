import 'package:flutter/cupertino.dart';

class EinstellungImpressum extends StatefulWidget {
  @override
  _EinstellungImpressumState createState() {
    return _EinstellungImpressumState();
  }
}

class _EinstellungImpressumState extends State<EinstellungImpressum> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Veranstaltung'),
        ),
      ],
    );
  }
}
