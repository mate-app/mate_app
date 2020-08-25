import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_tab.dart';
import 'mensa_tab.dart';
import 'news_tab.dart';
import 'verwaltung_tab.dart';
import 'einstellungen_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MateAppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            title: Text('Mensa'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper),
            title: Text('News'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Verwaltung'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Einstellungen'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: HomeTab(),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: MensaTab(),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: NewsTab(),
              );
            });
            break;
          case 3:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: VerwaltungTab(),
              );
            });
            break;
          case 4:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: EinstellungenTab(),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }
}
