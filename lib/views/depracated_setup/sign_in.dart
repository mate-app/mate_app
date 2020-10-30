// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:mateapp/services/services.dart';
// import 'package:mateapp/shared/widgets.dart';
// import 'package:mateapp/views/views.dart';
// import 'package:mateapp/models/models.dart';

// class SignInScreen extends StatefulWidget {
//   final University university; // university chosen in screen before
//   final Subject subject;
//   final int semester;
//   final Function toggleView; // function to toggle between forms

//   // Constructor
//   SignInScreen(
//       {@required this.university,
//       @required this.subject,
//       @required this.semester,
//       @required this.toggleView});

//   @override
//   _SignInScreenState createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   final AuthService _auth = AuthService(); // Firebase Authentication Service

//   bool _btnEnabled = false;
//   bool _loading = false;

//   final MailFieldContent email = MailFieldContent('');
//   final PasswordFieldContent password = PasswordFieldContent('');

//   FocusNode passwordFocusNode;

// void validateForm() {
//   setState(() => _btnEnabled = false);
//   if (email.checkIfFieldsAreEmpty() || password.checkIfFieldsAreEmpty())
//     return;
//   setState(() => _btnEnabled = true);
// }

// void sendForm() async {
//   await _auth
//       .loginWithEmailAndPassword(
//           email.fieldContent + widget.university.domain,
//           password.fieldContent)
//       .then((value) {
//     Navigator.pushAndRemoveUntil(
//         context,
//         CupertinoPageRoute(builder: (context) => Wrapper()),
//         (route) => false);
//   }, onError: (error) {
//     setState(() => _loading = false);
//     _loginAlert(message: error);
//   });
// }

// Future<void> _loginAlert(
//     {String message = 'Ein unbekannter Fehler ist aufgetreten.'}) async {
//   return showCupertinoDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return CupertinoAlertDialog(
//           title: PlatformText('Fehler'),
//           content: PlatformText(message),
//           actions: <Widget>[
//             CupertinoDialogAction(
//                 child: PlatformText('nochmal versuchen'),
//                 onPressed: () {
//                   setState(() => _btnEnabled = false);
//                   Navigator.pop(context);
//                 }),
//           ],
//         );
//       });
// }

// @override
// void initState() {
//   super.initState();
//   passwordFocusNode = FocusNode();
// }

// @override
// void dispose() {
//   passwordFocusNode.dispose();
//   super.dispose();
// }

//   @override
//   Widget build(BuildContext context) {
//     return _loading
//         ? LoadingScreen()
//         : CupertinoPageScaffold(
//             navigationBar: CupertinoNavigationBar(
//                 border: null, backgroundColor: CupertinoColors.white),
//             child: Center(
//               child: Form(
//                   child: Column(
//                 children: <Widget>[
//                   SizedBox(height: 40),
//                   PlatformText(
//                     'Anmeldung',
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
//                   ),
//                   SizedBox(height: 20),
//                   PlatformText('Melde dich mit den Zugangsdaten'),
//                   PlatformText('von deiner Hochschule an.'),
//                   SizedBox(height: 30),
//                   Container(
//                     width: 300,
//                     height: 44,
//                     child: CupertinoTextField(
//                       autofocus: true,
//                       placeholder: 'mail' + widget.university.domain,
//                       suffix: PlatformText(widget.university.domain),
//                       suffixMode: OverlayVisibilityMode.editing,
//                       expands: false,
//                       clearButtonMode: OverlayVisibilityMode.editing,
//                       onChanged: (val) {
//                         setState(() => email.fieldContent = val);
//                         validateForm();
//                       },
//                       maxLength: 50,
//                       maxLines: 1,
//                       maxLengthEnforced: true,
//                       onEditingComplete: () => passwordFocusNode.requestFocus(),
//                       keyboardType: TextInputType.text,
//                       textInputAction: TextInputAction.next,
//                       autocorrect: false,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Container(
//                     width: 300,
//                     height: 44,
//                     child: CupertinoTextField(
// focusNode: passwordFocusNode,
// placeholder: 'Passwort',
// clearButtonMode: OverlayVisibilityMode.editing,
// obscureText: true,
// onChanged: (val) {
//   setState(() => password.fieldContent = val);
//   validateForm();
// },
// maxLength: 20,
// maxLines: 1,
// maxLengthEnforced: true,
// onEditingComplete: _btnEnabled
//     ? () {
//         setState(() => _loading = true);
//         sendForm();
//       }
//     : null,
// keyboardType: TextInputType.visiblePassword,
// textInputAction: TextInputAction.send,
// autocorrect: false,
//                     ),
//                   ),
//                   SizedBox(height: 20),
// CupertinoButton.filled(
//   padding: EdgeInsets.symmetric(vertical: 0, horizontal: 112),
//   child: PlatformText('Anmelden'),
//   onPressed: _btnEnabled
//       ? () {
//           setState(() => _loading = true);
//           sendForm();
//         }
//       : null,
// ),
// CupertinoButton(
//   padding: EdgeInsets.symmetric(vertical: 0),
//   child: PlatformText(
//     'Neu? Jetzt Registrieren',
//     style: TextStyle(fontSize: 14),
//   ),
//   onPressed: () async {
//     widget.toggleView();
//   },
// ),
//                 ],
//               )),
//             ),
//           );
//   }
// }
