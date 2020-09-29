import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/services/auth.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/subjects.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

Future<void> main() async {
  // Mock classes from Firebase Auth
  final MockFirebaseAuth _auth = MockFirebaseAuth();
  final MockFirebaseUser _currentuser = MockFirebaseUser();
  final BehaviorSubject<MockFirebaseUser> _user =
      BehaviorSubject<MockFirebaseUser>();

  // Mock methods from Firebase Auth
  when(_auth.currentUser).thenReturn(_currentuser);
  when(_auth.authStateChanges()).thenAnswer((_) => _user);
  // when(_auth.signInWithEmailAndPassword(email: 'email', password: 'password'))
  //     .thenAnswer((_) async {
  //   _user.add(MockFirebaseUser());
  //   return MockUserCredential();
  // });

  // instantiate AuthService Class
  final AuthService _authService = AuthService(auth: _auth);

  // Run Tests
  group('Test Firebase authentication class', () {
    test('Should return current User', () {
      expect(_authService.getUser, isInstanceOf<User>());
    });

    test('Should return a Stream<User>', () {
      expect(_authService.user, isInstanceOf<Stream<User>>());
    });
  });
}
