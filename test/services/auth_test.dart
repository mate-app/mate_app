import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mateapp/models/models.dart';
import 'package:mateapp/services/services.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart' hide Subject;
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_mock.dart';

class MockClient extends Mock implements http.Client {}

Future<void> main() async {
  final MockFirebaseAuth _auth = MockFirebaseAuth();
  final MockUserCredential _userCredential = MockUserCredential();
  final BehaviorSubject<MockFirebaseUser> _user =
      BehaviorSubject<MockFirebaseUser>();
  final MockFirestoreInstance _firestore = MockFirestoreInstance();
  final MockClient _client = MockClient();
  final MockFirebaseUser _mockUser = MockFirebaseUser();
  SharedPreferences.setMockInitialValues({});

  group('Test Firebase authentication class', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    final AuthService _authService =
        AuthService(auth: _auth, firestore: _firestore, client: _client);

    test('Should return current User', () {
      expect(_authService.getUser, isInstanceOf<User>());
    });

    test('Should return a Stream<User>', () {
      when(_auth.authStateChanges()).thenAnswer((_) => _user);
      expect(_authService.user, isInstanceOf<Stream<User>>());
    });

    test('Should return User on login', () async {
      // Setup
      when(_auth.signInWithEmailAndPassword(
              email: 'email@example.com', password: 'password'))
          .thenAnswer((_) async {
        _user.add(MockFirebaseUser());
        return _userCredential;
      });
      // test
      final user = await _authService.loginWithEmailAndPassword(
          'email@example.com', 'password');
      expect(user, isInstanceOf<User>());
    });

    test('Should throw Unknown Exception', () async {
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

    test('Should return User on anonymous login', () async {
      // Setup
      when(_auth.signInAnonymously()).thenAnswer((_) async {
        _user.add(MockFirebaseUser());
        return _userCredential;
      });
      // Test
      final user = await _authService.anonLogin(University());
      expect(user, isInstanceOf<User>());
    });

    test('Should throw unknown expection', () async {
      // Setup
      when(_auth.signInAnonymously()).thenAnswer((_) async {
        throw Exception();
      });
      // Test
      final errorMsg =
          await _authService.anonLogin(University()).catchError((e) => e);
      expect(errorMsg, 'Ein unbekannter Fehler ist aufgetreten.');
    });

    test('Should return User on account upgrade', () async {
      // Setup
      when(_mockUser.linkWithCredential(any))
          .thenAnswer((_) async => _userCredential);
      // Test
      final user = await _authService.upgradeUserAccount(
          email: 'email@example.com',
          password: 'password',
          subject: Subject(),
          semester: 1);
      expect(user, isInstanceOf<User>());
    });

    test('Should return future void', () async {
      expect(await _authService.signOut(), null);
    });
  });
}
