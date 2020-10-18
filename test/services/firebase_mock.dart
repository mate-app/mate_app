import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  User get currentUser => MockFirebaseUser();
}

class MockFirebaseUser extends Mock implements User {
  @override
  String get uid => 'uid';
}

class MockUserCredential extends Mock implements UserCredential {
  @override
  User get user => MockFirebaseUser();
}
