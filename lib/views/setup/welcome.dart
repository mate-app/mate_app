import 'package:flutter/cupertino.dart';
import 'package:mateapp/views/views.dart';

// TODO: remove import and use inheritance
import 'package:mateapp/styles/styles.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    //
    //Variablen
    var size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
        child: Column(
      children: <Widget>[
        Container(
          height: size.height / 1.35,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/welcomescreen.png"),
              fit: BoxFit.contain,
            ),
          ),
          child: null,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 12.5, 30, 0),
          child: Text(
            'Lege sofort los und beantworte nur ein paar Fragen, damit Mate dir genau das zeigt, was für dich wichtig ist.',
            style: Styles.font.apply(color: Styles.grey),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: CupertinoButton.filled(
              child: Text('Loslegen'),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => LegalScreen()));
              }),
        ),
        SizedBox(height: 20)
      ],
    ));
  }
}
