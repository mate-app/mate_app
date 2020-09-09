import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    Calender(),
    Cafeteria(),
    News(),
    Organisation(),
    Settings()
  ];

  List<BottomNavigationBarItem> items(BuildContext context) => [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          title: Text(titles[0]),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.restaurant),
          title: Text(titles[1]),
        ),
        BottomNavigationBarItem(
          icon: const Icon(FontAwesomeIcons.newspaper),
          title: Text(titles[2]),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.school),
          title: Text(titles[3]),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          title: Text(titles[4]),
        ),
      ];

  Widget tabBuilder(BuildContext context, int index) => CupertinoTabView(
        builder: (context) => CupertinoPageScaffold(
          child: tabs[index],
        ),
      );

  PlatformTabController tabController;

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      iosContentPadding: true,
      tabController: tabController,
      bodyBuilder: tabBuilder,
      items: items(context),
    );
  }
}
