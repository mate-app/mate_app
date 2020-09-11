import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../styles/styles.dart';

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
      color: MateColors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: PlatformText('Personen'),
          ),
        ],
      ),
    );
  }
}
