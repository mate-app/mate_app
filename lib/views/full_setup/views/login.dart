import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';
import '../../../shared/shared.dart';
import '../../../styles/colors.dart';
import '../../../styles/styles.dart';
import '../../views.dart';

class Login extends StatefulWidget {
  final Subject subject;
  final int semester;
  final UserModel user;

  const Login(
      {Key key,
      @required this.subject,
      @required this.semester,
      @required this.user})
      : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _authService = AuthService();

  bool _btnEnabled = false;
  bool _loading = false;

  final MailFieldContent email = MailFieldContent('');
  final PasswordFieldContent password = PasswordFieldContent('');

  FocusNode passwordFocusNode;

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

  void validateForm() {
    setState(() => _btnEnabled = false);
    if (email.toString() == '') return;
    if (password.toString() == '') return;
    if (password.isPasswordSecure()) {
      setState(() => _btnEnabled = true);
    }
    return;
  }

  Future<void> login() async {
    await _authService
        .loginWithEmailAndPassword(
            email.fieldContent + widget.user.domain, password.fieldContent)
        .then((value) async {
      Navigator.pushAndRemoveUntil(context,
          CupertinoPageRoute(builder: (context) => Home()), (route) => false);
    }, onError: (error) {
      setState(() => _loading = false);
      _alert(message: error.toString());
    });
  }

  Future<void> register() async {
    await _authService
        .upgradeUserAccount(
            email: email.fieldContent + widget.user.domain,
            password: password.fieldContent,
            subject: widget.subject,
            semester: widget.semester)
        .then((value) {
      Navigator.pushAndRemoveUntil(context,
          CupertinoPageRoute(builder: (context) => Home()), (route) => false);
    }, onError: (error) {
      setState(() => _loading = false);
      _alert(message: error.toString());
    });
  }

  Future<void> _alert(
      {String message = 'Ein unbekannter Fehler ist aufgetreten.'}) async {
    return showPlatformDialog(
        context: context,
        builder: (BuildContext context) {
          return PlatformAlertDialog(
            title: const Text('Fehler'),
            content: Text(message),
            actions: <Widget>[
              PlatformDialogAction(
                onPressed: () {
                  setState(() => _btnEnabled = false);
                  Navigator.pop(context);
                },
                child: PlatformText(
                  'nochmal versuchen',
                  style: TextStyle(
                    color: Platform.isAndroid
                        ? MateColors.primary
                        : MateColors.primary,
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const LoadingScreen();
    } else {
      return Scaffold(
        backgroundColor: MateColors.white,
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            SizedBox(height: Platform.isAndroid ? 100 : 150),
            Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/bottle.png"),
                    fit: BoxFit.contain,
                  ),
                )),
            const SizedBox(height: 60),
            const Text(
              'Anmeldung',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: MateColors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              'Melde dich mit den Zugangsdaten für dein Hochschulnetzwerk an, um weitere Funktionen freizuschalten.',
              style: MateTextstyles.font,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    MateShadows.boxShadow,
                  ],
                  borderRadius: MateShapes.roundedEdges,
                ),
                height: 50,
                child: CupertinoTextField(
                  autofocus: true,
                  placeholder: 'mail${widget.user.domain}',
                  suffix: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(widget.user.domain)),
                  suffixMode: OverlayVisibilityMode.editing,
                  clearButtonMode: OverlayVisibilityMode.editing,
                  onChanged: (val) {
                    setState(() => email.fieldContent = val);
                    validateForm();
                  },
                  padding: const EdgeInsets.only(left: 16),
                  maxLength: 50,
                  onEditingComplete: () => passwordFocusNode.requestFocus(),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    MateShadows.boxShadow,
                  ],
                  borderRadius: MateShapes.roundedEdges,
                ),
                height: 50,
                child: CupertinoTextField(
                  focusNode: passwordFocusNode,
                  placeholder: 'Passwort',
                  clearButtonMode: OverlayVisibilityMode.editing,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password.fieldContent = val);
                    validateForm();
                  },
                  padding: const EdgeInsets.only(left: 16),
                  maxLength: 20,
                  onEditingComplete: _btnEnabled
                      ? () {
                          setState(() => _loading = true);
                          validateForm();
                        }
                      : null,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.send,
                  autocorrect: false,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PlatformButton(
                onPressed: _btnEnabled
                    ? () async {
                        setState(() => _loading = true);
                        await register();
                      }
                    : null,
                cupertinoFilled: (_, __) => CupertinoFilledButtonData(),
                materialFlat: (_, __) => MaterialFlatButtonData(
                  padding: const EdgeInsets.fromLTRB(0, 13, 0, 13),
                  shape: const RoundedRectangleBorder(
                      borderRadius: MateShapes.roundedEdges),
                  disabledColor: Colors.black12,
                  color: MateColors.primary,
                ),
                child: PlatformText(
                  'Registrieren',
                  style: const TextStyle(color: MateColors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: Text(
                      ' Du hast schon einen mate Account?',
                      style: MateTextstyles.small,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  PlatformButton(
                    materialFlat: (_, __) => MaterialFlatButtonData(
                        color: MateColors.white, textColor: MateColors.primary),
                    padding: const EdgeInsets.only(right: 3),
                    onPressed: _btnEnabled
                        ? () async {
                            setState(() => _loading = true);
                            await login();
                          }
                        : null,
                    child: PlatformText(
                      'Anmelden',
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
