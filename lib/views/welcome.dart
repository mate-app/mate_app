import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../styles/styles.dart';
import 'home.dart';
import 'universities.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
    final User user = Provider.of<User>(context);
    if (user != null) {
      Navigator.pushReplacement(
          context, platformPageRoute(context: context, builder: (_) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Column(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height / 1.35,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/welcomescreen.png"),
                  fit: BoxFit.contain,
                ),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 12.5, 30, 0),
            child: PlatformText(
              'Lege sofort los und genieße dein ganzes Studium in nur einer App.',
              style: MateTextstyles.font.apply(color: MateColors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: PlatformButton(
              onPressed: () {
                Navigator.push(
                    context,
                    platformPageRoute(
                        context: context, builder: (_) => Universities()));
              },
              child: PlatformText('Loslegen'),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
