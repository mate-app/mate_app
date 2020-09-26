import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/models/models.dart';

void main() {
  group('Test Grade Model', () {
    const docid = 'id';
    test('Should return Grade Instance', () {
      // setup
      final mockData = {
        'course': 'course',
        'credit_points': 'creditPoints',
        'grade': 'grade',
        'percentage': 'percentage',
        'semester': 'semester',
        'status': 'status',
        'tries': 2,
      };
      // test
      expect(Grade.fromMap(docid, mockData), isInstanceOf<Grade>());
      expect(Grade.fromMap(docid, mockData).id, 'id');
      expect(Grade.fromMap(docid, mockData).course, 'course');
      expect(Grade.fromMap(docid, mockData).creditPoints, 'creditPoints');
      expect(Grade.fromMap(docid, mockData).grade, 'grade');
      expect(Grade.fromMap(docid, mockData).percentage, 'percentage');
      expect(Grade.fromMap(docid, mockData).semester, 'semester');
      expect(Grade.fromMap(docid, mockData).status, 'status');
      expect(Grade.fromMap(docid, mockData).tries, 2);
    });

    test('Should return empty string when using wrong type', () {
      // setup
      final mockData = {
        'grade': true,
      };
      // test
      expect(Grade.fromMap(docid, mockData).grade, '');
    });

    test('Should throw AssertionError, if null given to named constructor', () {
      expect(() => Grade.fromMap(docid, null), throwsA(isA<AssertionError>()));
    });

    test('Should return empty Grade if no parameters are used', () {
      expect(Grade(), isInstanceOf<Grade>());
      expect(Grade().grade, '');
      expect(Grade().tries, 0);
    });
  });
}
