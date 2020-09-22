import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mateapp/services/services.dart';
import 'package:mateapp/views/organisation/organisation_grades/organisation_grades.dart';

import '../../../styles/styles.dart';
import 'local_widgets.dart';

class OrganisationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 60),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Essential Links
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              width: 380,
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: MateColors.grey,
                )),
              ),
              child:
                  PlatformText("Essential Links", style: MateTextstyles.small),
            ),
            if (!AuthService().getUser.isAnonymous)
              OrganisationListItem(
                page: OrganisationGrades(),
                title: 'Notenübersicht',
              )
          ]),
    );
  }
}
