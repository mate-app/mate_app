import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// Custom
import 'package:mateapp/services/auth.dart';
import 'package:mateapp/views/wrapper.dart';
import 'package:mateapp/models/user.dart';
import 'styles/styles.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(MateApp());
}

class MateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: CupertinoApp(
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
        theme: CupertinoThemeData(
          barBackgroundColor: Color(0xddffffff),
          primaryColor: Styles.primary,
          scaffoldBackgroundColor: Styles.white,
          brightness: Brightness.light,
          textTheme: CupertinoTextThemeData(
            primaryColor: Styles.primary,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
