import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../models/models.dart';
import '../../../../shared/shared.dart';
import '../../../../styles/styles.dart';
import '../../full_setup.dart';

class SemesterList extends StatelessWidget {
  final Subject subject;

  const SemesterList({Key key, @required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: PlatformText('Fachsemester wählen'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: MateColors.white,
        ),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final int itemIndex = index ~/ 2;
                  if (index.isEven) {
                    return PlatformListItem(
                      itemIndex: itemIndex,
                      action: () async {
                        Navigator.push(
                            context,
                            platformPageRoute(
                                context: context,
                                builder: (_) => Login(
                                    subjectname: subject.name,
                                    semester: itemIndex + 1)));
                      },
                      text: '$itemIndex. Fachsemester',
                    );
                  }
                  return const Divider(
                    color: MateColors.lightGrey,
                    height: 0,
                  );
                },
                semanticIndexCallback: (Widget widget, int localIndex) {
                  if (localIndex.isEven) {
                    return localIndex ~/ 2;
                  }
                  return null;
                },
                childCount: math.max(0, subject.duration * 2 - 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
