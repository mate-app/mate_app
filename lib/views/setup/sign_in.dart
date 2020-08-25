import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/services/auth.dart';
import 'package:mateapp/views/loading.dart';
import 'package:mateapp/views/wrapper.dart';
import 'package:mateapp/models/form_field_content.dart';
import 'package:mateapp/models/university.dart';
import 'package:mateapp/models/subject.dart';

class SignInScreen extends StatefulWidget {
  final University university; // university chosen in screen before
  final Subject subject;
  final int semester;
  final Function toggleView; // function to toggle between forms

  // Constructor
  SignInScreen(
      {@required this.university,
      @required this.subject,
      @required this.semester,
      @required this.toggleView});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthService _auth = AuthService(); // Firebase Authentication Service

  bool _btnEnabled = false;
  bool _loading = false;

  final MailFieldContent email = MailFieldContent('');
  final PasswordFieldContent password = PasswordFieldContent('');

  FocusNode passwordFocusNode;

  void validateForm() {
    setState(() => _btnEnabled = false);
    if (email.checkIfFieldsAreEmpty() || password.checkIfFieldsAreEmpty())
      return;
    setState(() => _btnEnabled = true);
  }

  void sendForm() async {
    dynamic result = await _auth.loginWithEmailAndPassword(
        email.fieldContent + widget.university.emailDomain,
        password.fieldContent);
    if (result == null) {
      setState(() => _loading = false);
      _loginAlert();
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => Wrapper()),
          (route) => false);
    }
  }

  Future<void> _loginAlert() async {
    return showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Fehler'),
            content: Text('Bitte überprüfe deine e-Mail und dein Passwort.'),
            actions: <Widget>[
              CupertinoDialogAction(
                  child: Text('nochmal versuchen'),
                  onPressed: () {
                    setState(() => _btnEnabled = false);
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? LoadingScreen()
        : CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
                border: null, backgroundColor: CupertinoColors.white),
            child: Center(
              child: Form(
                  child: Column(
                children: <Widget>[
                  SizedBox(height: 40),
                  Text(
                    'Anmeldung',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20),
                  Text('Melde dich mit den Zugangsdaten'),
                  Text('von deiner Hochschule an.'),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 44,
                    child: CupertinoTextField(
                      autofocus: true,
                      placeholder: 'mail' + widget.university.emailDomain,
                      suffix: Text(widget.university.emailDomain),
                      suffixMode: OverlayVisibilityMode.editing,
                      expands: false,
                      clearButtonMode: OverlayVisibilityMode.editing,
                      onChanged: (val) {
                        setState(() => email.fieldContent = val);
                        validateForm();
                      },
                      maxLength: 50,
                      maxLines: 1,
                      maxLengthEnforced: true,
                      onEditingComplete: () => passwordFocusNode.requestFocus(),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      autocorrect: false,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    height: 44,
                    child: CupertinoTextField(
                      focusNode: passwordFocusNode,
                      placeholder: 'Passwort',
                      clearButtonMode: OverlayVisibilityMode.editing,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password.fieldContent = val);
                        validateForm();
                      },
                      maxLength: 20,
                      maxLines: 1,
                      maxLengthEnforced: true,
                      onEditingComplete: _btnEnabled
                          ? () {
                              setState(() => _loading = true);
                              sendForm();
                            }
                          : null,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.send,
                      autocorrect: false,
                    ),
                  ),
                  SizedBox(height: 20),
                  CupertinoButton.filled(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 112),
                    child: Text('Anmelden'),
                    onPressed: _btnEnabled
                        ? () {
                            setState(() => _loading = true);
                            sendForm();
                          }
                        : null,
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: Text(
                      'Neu? Jetzt Registrieren',
                      style: TextStyle(fontSize: 14),
                    ),
                    onPressed: () async {
                      widget.toggleView();
                    },
                  ),
                ],
              )),
            ),
          );
  }
}
