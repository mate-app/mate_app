import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/models/models.dart';

void main() {
  group('Test UserModel Model', () {
    const docid = 'id';

    test('Should return UserModel Instance', () {
      // setup
      final mockData = {
        'language': 'language',
        'mail': 'mail',
        'semester': 0,
        'subject': 'subject',
        'university': 'university',
        'department': 'department',
        'upvotes': ['up'],
        'downvotes': ['down'],
        'average': 0,
        'creditpoints': 0,
      };
      // test
      expect(UserModel.fromMap(docid, mockData), isInstanceOf<UserModel>());
      expect(UserModel.fromMap(docid, mockData).id, docid);
      expect(UserModel.fromMap(docid, mockData).language, 'language');
      expect(UserModel.fromMap(docid, mockData).mail, 'mail');
      expect(UserModel.fromMap(docid, mockData).semester, 0);
      expect(UserModel.fromMap(docid, mockData).subject, 'subject');
      expect(UserModel.fromMap(docid, mockData).university, 'university');
      expect(UserModel.fromMap(docid, mockData).department, 'department');
      expect(UserModel.fromMap(docid, mockData).upvotes, ['up']);
      expect(UserModel.fromMap(docid, mockData).downvotes, ['down']);
      expect(UserModel.fromMap(docid, mockData).average, 0);
      expect(UserModel.fromMap(docid, mockData).creditpoints, 0);
    });

    test('Should return empty string when using wrong type', () {
      // setup
      final mockData = {
        'mail': 453,
      };
      // test
      expect(UserModel.fromMap(docid, mockData).mail, '');
    });

    test('Should throw AssertionError, if null given to named constructor', () {
      expect(
          () => UserModel.fromMap(null, null), throwsA(isA<AssertionError>()));
    });

    test('Should return empty UserModel if null is given', () {
      expect(UserModel(), isInstanceOf<UserModel>());
    });
  });
}
