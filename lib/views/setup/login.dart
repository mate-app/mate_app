import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/models/university.dart';
import 'package:mateapp/views/setup/sign_in.dart';
import 'package:mateapp/views/setup/register.dart';
import 'package:mateapp/models/subject.dart';

class Login extends StatefulWidget {
  final University university; // university chosen in screen before
  final Subject subject;
  final int semester;

  // Constructor
  Login(
      {Key key,
      @required this.university,
      @required this.subject,
      @required this.semester})
      : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showSignIn = true; // whether or not the sign in should be shown

  /// is defined here and sets the state of [showSignIn]
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInScreen(
          university: widget.university,
          subject: widget.subject,
          semester: widget.semester,
          toggleView: toggleView);
    } else {
      return RegisterScreen(
          university: widget.university,
          subject: widget.subject,
          semester: widget.semester,
          toggleView: toggleView);
    }
  }
}
