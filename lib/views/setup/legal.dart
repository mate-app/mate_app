import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/views/setup/universities.dart';
import 'package:mateapp/models/university.dart';
import 'package:provider/provider.dart';
import 'package:mateapp/services/database.dart';
import 'package:mateapp/views/setup/subjects.dart';

class LegalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<University>>.value(
        value: DatabaseService().universityStream, child: LegalScreenContent());
  }
}

class LegalScreenContent extends StatefulWidget {
  @override
  _LegalScreenContentState createState() => _LegalScreenContentState();
}

class _LegalScreenContentState extends State<LegalScreenContent> {
  /// TODO: Fill with agb & datenschutzerklärung
  Future<void> _legalDialog(List<University> universities) async {
    return showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Akzeptieren?'),
            content: Text(
                'Du musst die AGB und Datenschutzerklärung lesen und bestätigen.'),
            actions: <Widget>[
              CupertinoDialogAction(
                  child: Text('zurück'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              CupertinoDialogAction(
                child: Text('Bestätigen'),
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                  if (universities.length == 1) {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                SubjectScreen(university: universities[0])));
                  } else {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => UniversityScreen()));
                  }
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final universities = Provider.of<List<University>>(context);

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Rechtliche Hinweise'),
          trailing: CupertinoButton(
            child: Text('Weiter'),
            padding: EdgeInsets.all(0),
            onPressed: () => {_legalDialog(universities)},
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 300),
          ],
        ));
  }
}
