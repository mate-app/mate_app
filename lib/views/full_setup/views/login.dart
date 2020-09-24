import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final String subjectname;
  final int semester;

  const Login({Key key, @required this.subjectname, @required this.semester})
      : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
