import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/models/models.dart';

void main() {
  group('Test Subject Model', () {
    const docid = 'id';

    test('Should return Subject Instance', () {
      // setup
      final mockData = {
        'name': 'name',
        'degree': 'degree',
        'duration': 6,
        'department': 'department',
        'type': 'type',
        'creditpoints': 'creditpoints',
      };
      // test
      expect(Subject.fromMap(docid, mockData), isInstanceOf<Subject>());
      expect(Subject.fromMap(docid, mockData).name, 'name');
      expect(Subject.fromMap(docid, mockData).id, 'id');
      expect(Subject.fromMap(docid, mockData).degree, 'degree');
      expect(Subject.fromMap(docid, mockData).duration, 6);
      expect(Subject.fromMap(docid, mockData).department, 'department');
      expect(Subject.fromMap(docid, mockData).type, 'type');
      expect(Subject.fromMap(docid, mockData).creditpoints, 0);
    });

    test('Should return empty string when using wrong type', () {
      // setup
      final mockData = {
        'name': 453,
      };
      // test
      expect(Subject.fromMap(docid, mockData).name, '');
    });

    test('Should throw AssertionError, if null given to named constructor', () {
      expect(() => Subject.fromMap(null, null), throwsA(isA<AssertionError>()));
    });

    test('Should return empty Subject if null is given', () {
      expect(Subject(), isInstanceOf<Subject>());
    });
  });
}
