import 'package:flutter/cupertino.dart';
import 'package:mateapp/widgets/widgets.dart';
import 'package:mateapp/models/models.dart';
import 'package:provider/provider.dart';
import 'package:mateapp/services/services.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../styles/styles.dart';

class VerwaltungNoten extends StatefulWidget {
  @override
  _VerwaltungNotenState createState() {
    return _VerwaltungNotenState();
  }
}

class _VerwaltungNotenState extends State<VerwaltungNoten> {
  Future<Response> _updateGrades(String id) async {
    final credentials = await SharedPreferences.getInstance();
    final email = credentials.getString('email');
    final password = credentials.getString('password');
    return await post(
        'https://us-central1-mate-app-e8033.cloudfunctions.net/scrapeGrades',
        // 'http://localhost:5001/mate-app-e8033/us-central1/scrapeGrades',
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(
            <String, String>{'id': id, 'email': email, 'password': password}));
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);

    return Container(
      color: Styles.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar('Noten'),
            pinned: true,
            floating: true,
          ),
          CupertinoSliverRefreshControl(
            onRefresh: () async {
              return await _updateGrades(user.id);
            },
          ),
          user == null
              ? SliverLoadingIndicator()
              : StreamBuilder(
                  stream: Collection<Grade>(
                      path: 'users/${user.id}/grades',
                      order: ['exam_number', 'ASC']).streamData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.hasError) {
                      print(snapshot.error);
                      return SliverLoadingIndicator();
                    }
                    return GradeList(snapshot.data);
                  }),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90,
              child: Text(''),
            ),
          ),
        ],
      ),
    );
  }
}

class GradeList extends StatelessWidget {
  final List<Grade> grades;

  GradeList(this.grades);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return CourseGradesEntry(grade: grades[index]);
      }, childCount: grades?.length ?? 0),
    );
  }
}

class CourseGradesEntry extends StatelessWidget {
  final Grade grade;
  const CourseGradesEntry({
    Key key,
    this.grade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: Row(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              grade.course ?? 'Kursname Ladefehler',
              style: Styles.font.apply(color: Styles.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Spacer(),
          Text(
            grade.grade ?? 0,
            style: Styles.font.apply(color: Styles.gradeStatus[grade.status]),
          ),
        ]),
      ),
    );
  }
}
