import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../models/models.dart';
import '../../../../styles/styles.dart';

class OrganisationGradeListItem extends StatelessWidget {
  final Grade grade;

  const OrganisationGradeListItem({Key key, this.grade}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        child: Row(children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: PlatformText(
              grade.course ?? 'Kursname Ladefehler',
              style: MateTextstyles.font.apply(color: MateColors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          PlatformText(
            grade.grade ?? '',
            style: MateTextstyles.font
                .apply(color: MateColors.statusColors[grade.status]),
          ),
        ]),
      ),
    );
  }
}
