import 'package:flutter/cupertino.dart';
import 'package:mateapp/widgets/widgets.dart';
import 'package:mateapp/models/models.dart';
import 'package:provider/provider.dart';
import 'package:mateapp/services/services.dart';
import '../../styles/styles.dart';

class VerwaltungNoten extends StatefulWidget {
  @override
  _VerwaltungNotenState createState() {
    return _VerwaltungNotenState();
  }
}

class _VerwaltungNotenState extends State<VerwaltungNoten> {
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
          user == null
              ? SliverLoadingIndicator()
              : StreamBuilder(
                  stream: Collection<Grade>(
                      path: 'users/${user.id}/grades',
                      order: ['exam_number', 'ASC']).streamData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.hasError) {
                      return SliverLoadingIndicator();
                    }
                    return GradeList(snapshot.data);
                  }),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 60,
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
          Text(
            grade.course,
            style: Styles.font.apply(color: Styles.grey),
          ),
          Spacer(),
          Text(
            grade.grade,
            style: Styles.font.apply(color: Styles.gradeStatus[grade.status]),
          ),
        ]),
      ),
    );
  }
}
