import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';
import '../../../shared/shared.dart';
import 'local_widgets/local_widgets.dart';

class Subjects extends StatelessWidget {
  final UserModel user;

  const Subjects({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AuthService().getUser.isAnonymous) {
      return FutureBuilder<List<Subject>>(
        future: Collection<Subject>(
          path: 'hochschulen/${user.university}/subjects',
          order: ['name', 'ASC'],
        ).getData(),
        builder: (BuildContext context, AsyncSnapshot<List<Subject>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return SubjectList(subjects: snapshot.data);
            }
          }
          return PlatformScaffold(
            body: Center(
              child: DynamicText('''
                  Sorry, wir haben leider keine Studiengänge gefunden. 
                  Prüfe deine Internetverbindung und probiere es nochmal 
                  oder wende dich an den Support unter support@mate-app.de.
                  '''),
            ),
          );
        },
      );
    } else {
      return PlatformScaffold(
        body: Center(
          child: DynamicText('''
              Du scheinst bereits eingeloggt zu sein.
              Probiere es nochmal oder wende dich an den Support unter support@mate-app.de.
          '''),
        ),
      );
    }
  }
}
