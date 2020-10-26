import 'package:flutter/material.dart';

import '../../../models/models.dart';
import 'local_widgets/local_widgets.dart';

class Semester extends StatelessWidget {
  final Subject subject;

  final UserModel user;

  const Semester({Key key, @required this.subject, @required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SemesterList(subject: subject, user: user);
  }
}
