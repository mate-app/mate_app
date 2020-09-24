import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';
import '../../../styles/styles.dart';

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
              return SubjectList();
            }
          }
          return PlatformScaffold(
            body: Center(
              child: Text('snapshot has no data'),
            ),
          );
        },
      );
    } else {
      return PlatformScaffold(
        body: Center(
          child: Text('user not anonymous'),
        ),
      );
    }
  }
}

class SubjectList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText('Studiengang wählen'),
      ),
      body: Container(
          decoration: const BoxDecoration(
            color: MateColors.white,
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(),
              ),
            ],
          )),
    );
  }
}
