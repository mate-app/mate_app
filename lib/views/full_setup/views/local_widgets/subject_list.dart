import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../models/models.dart';
import '../../../../shared/shared.dart';
import '../../../../styles/styles.dart';
import '../../full_setup.dart';

class SubjectList extends StatelessWidget {
  final List<Subject> subjects;

  const SubjectList({Key key, @required this.subjects}) : super(key: key);

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
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  final int itemIndex = index ~/ 2;
                  if (index.isEven) {
                    return PlatformListItem(
                      itemIndex: itemIndex,
                      action: Navigator.push(
                          context,
                          platformPageRoute(
                              context: context,
                              builder: (_) =>
                                  Semester(subject: subjects[itemIndex]))),
                      text: subjects[itemIndex].name,
                    );
                  }
                  return const Divider(
                    height: 0,
                    color: MateColors.lightGrey,
                  );
                }, semanticIndexCallback: (Widget widget, int localIndex) {
                  if (localIndex.isEven) {
                    return localIndex ~/ 2;
                  }
                  return null;
                }, childCount: math.max(0, subjects.length * 2 - 1)),
              ),
            ],
          )),
    );
  }
}
