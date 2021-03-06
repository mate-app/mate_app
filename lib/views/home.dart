import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../services/services.dart';
import '../utils/utils.dart';
import 'calendar/calendar.dart';
import 'views.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final titles = [
    'Termine',
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
          icon: const Icon(Icons.calendar_today),
          label: titles[0],
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.restaurant),
          label: titles[1],
        ),
        BottomNavigationBarItem(
          icon: const Icon(FontAwesomeIcons.newspaper),
          label: titles[2],
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.school),
          label: titles[3],
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: titles[4],
        ),
      ];

  Widget tabBuilder(BuildContext context, int index) => CupertinoTabView(
        builder: (context) => CupertinoPageScaffold(
          child: CustomScrollView(
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                largeTitle: Text(titles[index]),
              ),
              const CupertinoSliverRefreshControl(
                onRefresh: handleRefresh,
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
    return FutureProvider<UserModel>.value(
      value: UserDataService(collection: 'users').document,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          border: const Border(
            top: BorderSide(
              color: Colors.black12,
            ),
          ),
          items: items(context),
        ),
        tabBuilder: (context, index) => tabBuilder(context, index),
      ),
    );
  }
}
