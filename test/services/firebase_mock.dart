import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class AuthCredentialMock extends Mock implements AuthCredential {}

class FirebaseUserMock extends Mock implements User {
  @override
  String get displayName => 'John Doe';

  @override
  String get uid => 'uid';

  @override
  String get email => 'johndoe@mail.com';

  @override
  String get photoUrl => 'www.example.com';
}
