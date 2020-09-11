import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import 'services.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // provides an immediate event of the user's current authentication state,
  // and then provides subsequent events whenever the authentication state changes.
  Stream<User> get user {
    return _auth.authStateChanges();
  }

  Future<bool> _saveCredentials(String email, String password) async {
    final credentials = await SharedPreferences.getInstance();
    final bool emailSet = await credentials.setString('email', email);
    final bool passwordSet = await credentials.setString('password', password);
    final analyticsStorage = await SharedPreferences.getInstance();
    final bool analyticsOn =
        await analyticsStorage.setBool('analyticsOn', true);
    return (emailSet && passwordSet && analyticsOn) ?? false;
  }

  // checks whether the credentials are valid
  Future<bool> _checkCredentials(String email, String password) async {
    final Response response = await post(
        'https://us-central1-mate-app-e8033.cloudfunctions.net/validateUserdata',
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));
    if (response.body == 'false') {
      throw 'Du scheinst nicht bei der ausgewählten Insitution registriert zu sein.';
    }
    return true;
  }

  // sign in with mail and password
  Future loginWithEmailAndPassword(String email, String password) async {
    User user;
    String errorMessage;

    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
      await _saveCredentials(email, password);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          errorMessage =
              'Deine eingegebene E-Mail-Adresse ist leider ungültig.';
          break;
        case 'user-disabled':
          errorMessage =
              'Dein Benutzerkonto wurde deaktiviert. Melde dich bitte beim Support.';
          break;
        case 'user-not-found':
          errorMessage = 'Deine E-Mail-Adresse ist uns nicht bekannt.';
          break;
        case 'wrong-password':
          errorMessage = 'Dein Passwort ist leider nicht korrekt.';
          break;
        default:
          errorMessage = 'Ein unbekannter Fehler ist aufgetreten.';
      }
    } catch (error) {
      errorMessage = 'Ein unbekannter Fehler ist aufgetreten.';
    }

    if (errorMessage != null) {
      return Future.error(errorMessage);
    }

    return user;
  }

  // Register with email & password
  Future registerWithEmailAndPassword(String email, String password,
      University university, Subject subject, int semester) async {
    User user;
    String errorMessage;

    try {
      await _checkCredentials(email, password);

      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
      await UserData(collection: 'users').upsert({
        'user_id': user.uid,
        'mail': email,
        'university': university.shortName,
        'subject': subject.name,
        'semester': semester,
        'department': subject.department,
        'language': 'german',
        'upvotes': [],
        'downvotes': []
      });
      await _saveCredentials(email, password);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          errorMessage =
              'Deine eingegebene E-Mail-Adresse ist leider ungültig.';
          break;
        case 'weak-password':
          errorMessage =
              'Dein Passwort ist nicht sicher genug. Es muss mindestens 6 Zeichen lang sein.';
          break;
        case 'email-already-in-use':
          errorMessage = 'Du bist bei uns bereits registriert.';
          break;
        default:
          errorMessage = 'Ein unbekannter Fehler ist aufgetreten.';
      }
    } catch (e) {
      errorMessage = 'Ein unbekannter Fehler ist aufgetreten.';
    }

    if (errorMessage != null) {
      return Future.error(errorMessage);
    }

    return user;
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      Crashlytics.instance.recordError(e.toString(), StackTrace.current);
      return null;
    }
  }
}
