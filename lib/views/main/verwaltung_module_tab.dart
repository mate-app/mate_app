import 'package:flutter/cupertino.dart';

class VerwaltungModule extends StatefulWidget {
  @override
  _VerwaltungModuleState createState() {
    return _VerwaltungModuleState();
  }
}

class _VerwaltungModuleState extends State<VerwaltungModule> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Module'),
        ),
      ],
    );
  }
}
