import 'package:flutter/rendering.dart';
import 'package:mateapp/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/widgets/widgets.dart';
import '../../styles/styles.dart';

class VerwaltungModule extends StatefulWidget {
  @override
  _VerwaltungModuleState createState() {
    return _VerwaltungModuleState();
  }
}

class _VerwaltungModuleState extends State<VerwaltungModule> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MateColors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar('Module'),
            pinned: true,
            floating: true,
          ),
          ModulGridList(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 60,
              child: Text(''),
            ),
          ),
        ],
      ),
    );
  }
}

class ModulGridList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ModulGrid();
  }
}

class ModulGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(15),
      sliver: SliverGrid.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text("He'd have you all unravel at the"),
            color: MateColors.primary,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Heed not the rabble'),
            color: MateColors.primary,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Sound of screams but the'),
            color: MateColors.primary,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Who scream'),
            color: MateColors.primary,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution is coming...'),
            color: MateColors.primary,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            color: MateColors.primary,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            color: MateColors.primary,
          ),
        ],
      ),
    );
  }
}
