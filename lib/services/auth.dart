import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import 'services.dart';

class AuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final http.Client _client;

  AuthService(
      {FirebaseAuth auth, FirebaseFirestore firestore, http.Client client})
      : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _client = client ?? http.Client();

  Stream<User> get user {
    return _auth.authStateChanges();
  }

  User get getUser {
    return _auth.currentUser;
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
    final String response = await HttpService(client: _client).postReq(
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
      result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
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
      result = await _auth.signInAnonymously();
      await Document(firestore: _firestore, path: 'users/${result.user.uid}')
          .createAndMerge({
        'university': university.shortName,
        'domain': university.domain,
        'language': 'german',
        'votes': [],
        'upvotes': [],
        'downvotes': []
      });
    } catch (error) {
      errorMessage =
          firebaseErrors[error is FirebaseAuthException ? error.code : error] ??
              'Ein unbekannter Fehler ist aufgetreten.';
    }

    return errorMessage != null ? Future.error(errorMessage) : result.user;
  }

  // convert anonymous user to full user
  Future upgradeUserAccount(
      {String email, String password, Subject subject, int semester}) async {
    final User user = _auth.currentUser;
    final AuthCredential credential =
        EmailAuthProvider.credential(email: email, password: password);
    String errorMessage;

    try {
      // await _checkCredentials(email, password);
      await user.linkWithCredential(credential);
      await UserDataService(
              auth: _auth, firestore: _firestore, collection: 'users')
          .upsert(data: {
        'mail': email,
        'subject': subject.name,
        'semester': semester,
        'department': subject.department,
      });
    } catch (error) {
      errorMessage =
          firebaseErrors[error is FirebaseAuthException ? error.code : error] ??
              'Ein unbekannter Fehler ist aufgetreten.';
    }
    return errorMessage != null ? Future.error(errorMessage) : user;
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return;
    }
  }
}
