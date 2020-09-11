import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../styles/styles.dart';
import '../../../widgets/widgets.dart';

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
              child: PlatformText(''),
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
            color: MateColors.primary,
            child: PlatformText("He'd have you all unravel at the"),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: MateColors.primary,
            child: PlatformText('Heed not the rabble'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: MateColors.primary,
            child: PlatformText('Sound of screams but the'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: MateColors.primary,
            child: PlatformText('Who scream'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: MateColors.primary,
            child: PlatformText('Revolution is coming...'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: MateColors.primary,
            child: PlatformText('Revolution, they...'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: MateColors.primary,
            child: PlatformText('Revolution, they...'),
          ),
        ],
      ),
    );
  }
}
