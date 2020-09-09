import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mateapp/widgets/loading_screen.dart';
import 'package:provider/provider.dart';

import 'services/services.dart';
import 'styles/styles.dart';
import 'views/views.dart';

FirebaseAnalytics analytics;

void main() {
  Crashlytics.instance.enableInDevMode = true; // TODO: disable in Production
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  analytics = FirebaseAnalytics();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // set device to not rotate
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return FutureBuilder(
      // Initialize Flutterfire
      future: _initialization,
      builder: (context, snapshot) {
        // check for error
        if (snapshot.hasError ||
            snapshot.connectionState != ConnectionState.done) {
          Crashlytics.instance.recordError(snapshot.error, StackTrace.current);
          return const LoadingScreen();
        }

        return MultiProvider(
          providers: [
            StreamProvider<User>.value(value: AuthService().user),
          ],
          child: const App(),
        );
      },
    );
  }
}

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
      ],
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: true, // TODO: disable in Prod.
      home: Welcome(),
      cupertino: (_, __) => CupertinoAppData(
        theme: const CupertinoThemeData(
          barBackgroundColor: MateColors.white,
          primaryColor: MateColors.primary,
          scaffoldBackgroundColor: MateColors.white,
          brightness: Brightness.light,
          textTheme: CupertinoTextThemeData(
            primaryColor: MateColors.primary,
          ),
        ),
      ),
      material: (_, __) => MaterialAppData(
          theme: ThemeData(
        scaffoldBackgroundColor: MateColors.white,
        brightness: Brightness.light,
      )),
    );
  }
}
