import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import 'services.dart';

class AuthService {
  FirebaseAuth auth;

  AuthService({FirebaseAuth auth}) : auth = auth ?? FirebaseAuth.instance;

  Stream<User> get user {
    return auth.authStateChanges();
  }

  User get getUser {
    return auth.currentUser;
  }

  Future<bool> _saveCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final bool emailSet = await prefs.setString('email', email);
    final bool passwordSet = await prefs.setString('password', password);
    final bool analyticsOn = await prefs.setBool('analyticsOn', true);
    return (emailSet && passwordSet && analyticsOn) ?? false;
  }

  // checks whether the credentials are valid
  Future<bool> _checkCredentials(String email, String password) async {
    final String response = await HttpService().postReq(
      'https://us-central1-mate-app-e8033.cloudfunctions.net/validateUserdata',
      {'email': email, 'password': password},
    );
    return response == 'false' ? throw Error : true;
  }

  // login user with email and password
  Future loginWithEmailAndPassword(String email, String password) async {
    String errorMessage;
    UserCredential result;

    try {
      result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      await _saveCredentials(email, password);
    } catch (error) {
      errorMessage =
          firebaseErrors[error is FirebaseAuthException ? error.code : error] ??
              'Ein unbekannter Fehler ist aufgetreten.';
    }

    return errorMessage != null ? Future.error(errorMessage) : result.user;
  }

  // Register with email & password
  Future registerWithEmailAndPassword(String email, String password,
      University university, Subject subject, int semester) async {
    UserCredential result;
    String errorMessage;

    try {
      await _checkCredentials(email, password);
      result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await UserData(collection: 'users').upsert({
        'user_id': result.user.uid,
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
    } catch (error) {
      errorMessage =
          firebaseErrors[error is FirebaseAuthException ? error.code : error] ??
              'Ein unbekannter Fehler ist aufgetreten.';
    }

    return errorMessage != null ? Future.error(errorMessage) : result.user;
  }

  // Anonymous Firebase Login
  Future anonLogin(University university) async {
    UserCredential result;
    String errorMessage;

    try {
      result = await auth.signInAnonymously();
      await updateUserData(
        result.user,
        {
          'university': university.shortName,
          'language': 'german',
          'votes': [],
          'upvotes': [],
          'downvotes': []
        },
      );
    } catch (error) {
      errorMessage =
          firebaseErrors[error is FirebaseAuthException ? error.code : error] ??
              'Ein unbekannter Fehler ist aufgetreten.';
    }

    return errorMessage != null ? Future.error(errorMessage) : result.user;
  }

  // convert anonymous user to full user
  Future upgradeUserAccount(
      String email, String password, Subject subject, int semester) async {
    final User user = auth.currentUser;
    final AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    String errorMessage;

    try {
      await user.linkWithCredential(credential);
      await UserData(collection: 'users').upsert(
          {'mail': email, 'subject': subject.name, 'semester': semester});
    } catch (error) {
      errorMessage =
          firebaseErrors[error is FirebaseAuthException ? error.code : error] ??
              'Ein unbekannter Fehler ist aufgetreten.';
    }

    return errorMessage != null ? Future.error(errorMessage) : user;
  }

  Future<void> updateUserData(User user, Map<String, dynamic> data) async {
    final DocumentReference reportRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    return reportRef.set(data);
  }

  // sign out
  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
