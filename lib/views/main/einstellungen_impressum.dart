import 'package:flutter/cupertino.dart';

import '../../styles/styles.dart';

class EinstellungImpressum extends StatefulWidget {
  @override
  _EinstellungImpressumState createState() {
    return _EinstellungImpressumState();
  }
}

class _EinstellungImpressumState extends State<EinstellungImpressum> {
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
