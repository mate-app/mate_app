import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/models/custom_query.dart';

void main() {
  group('Test Custom Query Model', () {
    test('Should return a valid CustomQuery Instance', () {
      expect(CustomQuery(field: 'String', operation: '==', value: 12),
          isInstanceOf<CustomQuery>());
    });

    test('Should throw AssertionError when passing null as field', () {
      expect(() => CustomQuery(field: null, operation: null, value: null),
          throwsA(isA<AssertionError>()));
    });

    test('Should throw AssertionError when passing null as value', () {
      expect(() => CustomQuery(field: 'string', operation: '==', value: null),
          throwsA(isA<AssertionError>()));
    });

    test('Should throw AssertionError when passing unknown operator', () {
      expect(
          () => CustomQuery(
              field: 'string', operation: 'unknown operator', value: 'string'),
          throwsA(isA<AssertionError>()));
    });
  });
}
