import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';
import '../../../shared/shared.dart';
import 'local_widgets/local_widgets.dart';

class Universities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<University>>(
      future:
          Collection<University>(path: 'hochschulen', order: ['name', 'ASC'])
              .getData(),
      builder:
          (BuildContext context, AsyncSnapshot<List<University>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return UniversityList(universities: snapshot.data);
          }
        }
        return const LoadingScreen();
      },
    );
  }
}
