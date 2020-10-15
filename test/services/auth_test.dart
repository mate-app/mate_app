import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/services/services.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart' hide Subject;
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_mock.dart';

class MockHttpService extends Mock implements HttpService {}

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Mock classes from Firebase Auth
  final MockFirebaseAuth _auth = MockFirebaseAuth();
  final MockFirebaseUser _currentuser = MockFirebaseUser();
  final MockUserCredential _userCredential = MockUserCredential();
  final BehaviorSubject<MockFirebaseUser> _user =
      BehaviorSubject<MockFirebaseUser>();
  final MockHttpService _httpService = MockHttpService();

  // Mock methods from Firebase Auth
  when(_auth.authStateChanges()).thenAnswer((_) => _user);

  // instantiate AuthService Class
  SharedPreferences.setMockInitialValues({});
  final AuthService _authService = AuthService(auth: _auth);
  final UserDataService _userDataService =
      UserDataService(auth: _auth, user: _currentuser);

  // Run Tests
  group('Test Firebase authentication class', () {
    test('Should return current User', () {
      expect(_authService.getUser, isInstanceOf<User>());
    });

    test('Should return a Stream<User>', () {
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

    // test('Should return User on register', () async {
    //   // Setup
    //   when(_auth.createUserWithEmailAndPassword(
    //           email: 'email@example.com', password: 'password'))
    //       .thenAnswer((_) async {
    //     _user.add(MockFirebaseUser());
    //     return _userCredential;
    //   });
    //   when(_httpService.postReq(
    //       'https://us-central1-mate-app-e8033.cloudfunctions.net/validateUserdata',
    //       {
    //         'email': 'email@example.com',
    //         'password': 'password'
    //       })).thenAnswer((_) async => 'true');
    //   when(_userDataService.upsert(data: {
    //     'mail': 'email@example.com',
    //     'university': 'name',
    //     'subject': 'fach',
    //     'semester': 1,
    //     'department': 'fb',
    //     'language': 'german',
    //     'upvotes': [],
    //     'downvotes': []
    //   })).thenAnswer((_) async {
    //     return;
    //   });
    //   const String email = 'email@example.com';
    //   const String password = 'password';
    //   final University university = University(shortName: 'name');
    //   final Subject subject = Subject(name: 'fach', department: 'fb');
    //   const int semester = 1;

    //   // Test
    //   final user = await _authService.registerWithEmailAndPassword(
    //       email, password, university, subject, semester);

    //   expect(user, isInstanceOf<User>());
    // });
  });
}
