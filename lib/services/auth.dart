import 'package:firebase_auth/firebase_auth.dart';
import 'package:mateapp/models/user.dart';
import 'package:mateapp/services/database.dart';
import 'package:mateapp/models/subject.dart';
import 'package:mateapp/models/university.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // creates custom user object
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  // returns whenever there is a change in authentication
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // sign in with mail and password
  Future loginWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email & password
  Future registerWithEmailAndPassword(String email, String password,
      University university, Subject subject, int semester) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for user with uid
      await DatabaseService(uid: user.uid).updateUserData(user.uid, email,
          university.shortName, subject.name, semester, 'german');

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
