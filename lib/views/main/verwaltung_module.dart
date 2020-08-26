import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mateapp/styles/styles.dart';

class VerwaltungModule extends StatefulWidget {
  @override
  _VerwaltungModuleState createState() {
    return _VerwaltungModuleState();
  }
}

class _VerwaltungModuleState extends State<VerwaltungModule> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Container(
            padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
            child: Text(
              'Module',
              style: TextStyle(fontSize: 16, color: Color(0xff000000)),
            ),
          ),
          leading: CupertinoButton(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios)),
          iconTheme: IconThemeData(color: Styles.primary),
          backgroundColor: Color(0xddffffff),
          centerTitle: true,
          collapsedHeight: 44,
          toolbarHeight: 43,
          pinned: true,
          elevation: 0.1,
          shadowColor: Color(0x00ffffff),
          flexibleSpace: Container(
            height: 68,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 68,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            border: Border(
                                bottom: BorderSide(
                                    width: 0.125, color: Color(0xff000000)))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ModulGridList(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
            child: Text(''),
          ),
        ),
      ],
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
            color: Styles.primary,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Heed not the rabble'),
            color: Styles.primary,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Sound of screams but the'),
            color: Styles.primary,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Who scream'),
            color: Styles.primary,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution is coming...'),
            color: Styles.primary,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            color: Styles.primary,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            color: Styles.primary,
          ),
        ],
      ),
    );
  }
}
