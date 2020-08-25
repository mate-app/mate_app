import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/models/university.dart';
import 'package:mateapp/services/auth.dart';
import 'package:mateapp/views/loading.dart';
import 'package:mateapp/views/wrapper.dart';
import 'package:mateapp/models/form_field_content.dart';
import 'package:mateapp/models/subject.dart';

class RegisterScreen extends StatefulWidget {
  final University university; // university chosen in screen before
  final Subject subject;
  final int semester;
  final Function
      toggleView; // Function for toggling between Sign in an Registration Form

  // Constructer
  RegisterScreen(
      {@required this.university,
      @required this.subject,
      @required this.semester,
      @required this.toggleView});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    if (password.validatePasswordContent(31, 6))
      setState(() => _btnEnabled = true);
  }

  void sendForm() async {
    dynamic result = await _auth.registerWithEmailAndPassword(
        email.fieldContent + widget.university.emailDomain,
        password.fieldContent,
        widget.university,
        widget.subject,
        widget.semester);
    if (result == null) {
      setState(() => _loading = false);
      _registerAlert();
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => Wrapper()),
          (route) => false);
    }
  }

  Future<void> _registerAlert() async {
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
                    'Registrierung',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20),
                  Text('Registriere dich mit den Zugangsdaten'),
                  Text('von deiner Hochschule.'),
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
                      maxLength: 100,
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
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 104),
                    child: Text('Registrieren'),
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
                      'Bereits registriert? Jetzt Einloggen',
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
