import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/services/auth.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Mock classes from Firebase Auth
  final MockFirebaseAuth _auth = MockFirebaseAuth();
  final MockFirebaseUser _currentuser = MockFirebaseUser();
  final MockUserCredential _userCredential = MockUserCredential();
  final BehaviorSubject<MockFirebaseUser> _user =
      BehaviorSubject<MockFirebaseUser>();

  // Mock methods from Firebase Auth
  when(_auth.currentUser).thenReturn(_currentuser);
  when(_auth.authStateChanges()).thenAnswer((_) => _user);
  when(_auth.signInWithEmailAndPassword(
          email: 'email@example.com', password: 'password'))
      .thenAnswer((_) async {
    _user.add(MockFirebaseUser());
    return _userCredential;
  });
  when(_userCredential.user).thenReturn(MockFirebaseUser());

  // instantiate AuthService Class
  SharedPreferences.setMockInitialValues({});
  final AuthService _authService = AuthService(auth: _auth);

  // Run Tests
  group('Test Firebase authentication class', () {
    test('Should return current User', () {
      expect(_authService.getUser, isInstanceOf<User>());
    });

    test('Should return a Stream<User>', () {
      expect(_authService.user, isInstanceOf<Stream<User>>());
    });

    test('Should return User', () async {
      // Setup
      const String email = 'email@example.com';
      const String password = 'password';
      // test
      final user =
          await _authService.loginWithEmailAndPassword(email, password);
      expect(user, isInstanceOf<User>());
    });

    test('Unknown Exception', () async {
      // Setup
      when(_auth.signInWithEmailAndPassword(
              email: 'unknown', password: 'password'))
          .thenAnswer((_) {
        throw Exception();
      });
      // Test
      final errorMsg = await _authService
          .loginWithEmailAndPassword('unknown', 'password')
          .catchError((e) => e);
      expect(errorMsg, 'Ein unbekannter Fehler ist aufgetreten.');
    });
  });
}
