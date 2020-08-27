import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/widgets/widgets.dart';
import 'package:mateapp/services/services.dart';
import 'package:mateapp/views/views.dart';
import 'package:mateapp/models/models.dart';

// TODO: remove style import and use inheritance
import 'package:mateapp/styles/styles.dart';

void main() => runApp(MateApp());

class MateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // set device to not rotate
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    //
    return FutureBuilder(
        // Initialize Flutterfire
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // check for error
          if (snapshot.hasError) {
            return null;
          }

          // show application
          if (snapshot.connectionState == ConnectionState.done) {
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

          // show loading screen otherwise
          return CupertinoApp(
            home: LoadingScreen(),
          );
        });
  }
}
