import 'package:flutter/material.dart';

import '../../../../models/models.dart';
import 'local_widgets.dart';

class OrganisationGradeList extends StatelessWidget {
  final List<Grade> grades;

  const OrganisationGradeList({Key key, this.grades}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return OrganisationGradeListItem(grade: grades[index]);
      }, childCount: grades?.length ?? 0),
    );
  }
}
