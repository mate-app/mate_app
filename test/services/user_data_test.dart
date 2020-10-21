import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/services/user_data.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  MockFirebaseUser user;

  MockFirebaseAuth({this.user});

  @override
  User get currentUser => user;
}

class MockFirebaseUser extends Mock implements User {
  @override
  String get uid => 'uid';
}

void main() {
  // firebase mock classes
  final MockFirebaseAuth _auth = MockFirebaseAuth(user: MockFirebaseUser());
  final MockFirestoreInstance _firestore = MockFirestoreInstance();
  group('Test UserDataService Class', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    final UserDataService _userData = UserDataService(
        collection: 'users', auth: _auth, firestore: _firestore);

    test('Should return Stream<UserModel>', () {
      expect(_userData.documentStream, isInstanceOf<Stream<UserModel>>());
    });

    test('Should return empty stream', () {
      final MockFirebaseAuth _auth = MockFirebaseAuth();
      final UserDataService _userData = UserDataService(
          collection: 'users', auth: _auth, firestore: _firestore);
      expect(_userData.documentStream, isInstanceOf<Stream<UserModel>>());
    });

    test('Should return void and set/change document', () async {
      await _firestore.collection('users').doc('uid').set({
        'user_id': 'old',
      });
      await _userData.upsert(data: {'hochschule': 'fhkiel'});
      expect(
          _firestore.dump(),
          '{\n'
          '  "users": {\n'
          '    "uid": {\n'
          '      "user_id": "uid",\n'
          '      "hochschule": "fhkiel"\n'
          '    }\n'
          '  }\n'
          '}');
    });
  });
}
