import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../services/services.dart';
import 'calendar/calendar.dart';
import 'views.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final titles = [
    'Home',
    'Mensa',
    'News',
    'Verwaltung',
    'Einstellungen'
  ];
  List<Widget> tabs = [
    Calendar(),
    Cafeteria(),
    News(),
    Organisation(),
    Settings()
  ];

  List<BottomNavigationBarItem> items(BuildContext context) => [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          title: PlatformText(titles[0]),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.restaurant),
          title: PlatformText(titles[1]),
        ),
        BottomNavigationBarItem(
          icon: const Icon(FontAwesomeIcons.newspaper),
          title: PlatformText(titles[2]),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.school),
          title: PlatformText(titles[3]),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          title: PlatformText(titles[4]),
        ),
      ];

  Widget tabBuilder(BuildContext context, int index) => CupertinoTabView(
        builder: (context) => CupertinoPageScaffold(
          child: CustomScrollView(
            slivers: <Widget>[
              PlatformWidget(
                material: (context, platform) => SliverAppBar(
                  // pinned: true,
                  // forceElevated: true,
                  expandedHeight: 120.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: PlatformText(titles[index]),
                  ),
                ),
                cupertino: (context, platform) => CupertinoSliverNavigationBar(
                  largeTitle: PlatformText(titles[index]),
                ),
              ),
              tabs[index],
            ],
          ),
        ),
      );

  PlatformTabController tabController;

  @override
  void initState() {
    super.initState();
    tabController ??= PlatformTabController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: UserData<UserModel>(collection: 'users').documentStream,
      child: PlatformTabScaffold(
        iosContentPadding: true,
        tabController: tabController,
        bodyBuilder: (context, index) => tabBuilder(context, index),
        items: items(context),
      ),
    );
  }
}
