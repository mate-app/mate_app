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
  int _currentIndex;

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
              PlatformWidget(
                material: (context, platform) => SliverAppBar(
                  pinned: true,
                  forceElevated: true,
                  expandedHeight: 120.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: PlatformText(titles[index]),
                  ),
                  elevation: 1,
                ),
                cupertino: (context, platform) => CupertinoSliverNavigationBar(
                  largeTitle: PlatformText(titles[index]),
                ),
              ),
              PlatformWidget(
                material: (_, __) => SliverToBoxAdapter(
                  child: Container(),
                ),
                cupertino: (_, __) => index < 3
                    ? const CupertinoSliverRefreshControl(
                        onRefresh: handleRefresh,
                      )
                    : SliverToBoxAdapter(
                        child: Container(),
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
    _currentIndex = 0;
    tabController ??= PlatformTabController();
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureProvider<UserModel>.value(
      value: UserDataService(collection: 'users').document,
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: items(context),
          onTap: (index) => _changeTab(index),
        ),
        tabBuilder: (context, index) => tabBuilder(context, index),
      ),
    );
  }
}
