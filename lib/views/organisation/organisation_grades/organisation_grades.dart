import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:http/http.dart';
import 'package:mateapp/views/organisation/organisation_grades/local_widgets/local_widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';
import '../../../styles/styles.dart';
import '../../../widgets/widgets.dart';

class OrganisationGrades extends StatelessWidget {
  Future<Response> _updateGrades(String id) async {
    final credentials = await SharedPreferences.getInstance();
    final email = credentials.getString('email');
    final password = credentials.getString('password');
    return post(
        'https://us-central1-mate-app-e8033.cloudfunctions.net/scrapeGrades',
        // 'http://localhost:5001/mate-app-e8033/us-central1/scrapeGrades',
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(
            <String, String>{'id': id, 'email': email, 'password': password}));
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);

    return Container(
      color: MateColors.white,
      child: PlatformWidgetBuilder(
        material: (_, child, __) => RefreshIndicator(
          onRefresh: () async => _updateGrades(user.id),
          child: child,
        ),
        cupertino: (_, child, __) => Container(
          child: child,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: StaticNavigationBar('Noten'),
              pinned: true,
              floating: true,
            ),
            PlatformWidget(
              cupertino: (_, __) => CupertinoSliverRefreshControl(
                onRefresh: () async {
                  return _updateGrades(user.id);
                },
              ),
            ),
            if (user == null)
              const SliverLoadingIndicator()
            else
              StreamBuilder(
                  stream: Collection<Grade>(
                      path: 'users/${user.id}/grades',
                      order: ['exam_number', 'ASC']).streamData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Grade>> snapshot) {
                    if (snapshot.hasData) {
                      return OrganisationGradeList(grades: snapshot.data);
                    }
                    return const SliverLoadingIndicator();
                  }),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
