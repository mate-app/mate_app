import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/models/custom_query.dart';

void main() {
  group('Test Custom Query Model', () {
    const string = 'string';
    const operatorString = '==';

    test('Should return a valid CustomQuery Instance', () {
      expect(
          CustomQuery(field: string, operation: operatorString, value: string),
          isInstanceOf<CustomQuery>());
    });

    test('Should throw AssertionError when passing null as field', () {
      expect(
          () => CustomQuery(
              field: null, operation: operatorString, value: string),
          throwsA(isA<AssertionError>()));
    });

    test('Should throw AssertionError when passing null as value', () {
      expect(
          () => CustomQuery(
              field: string, operation: operatorString, value: null),
          throwsA(isA<AssertionError>()));
    });

    test('Should throw AssertionError when passing unknown operator', () {
      expect(
          () => CustomQuery(
              field: string, operation: 'unknown operator', value: string),
          throwsA(isA<AssertionError>()));
    });
  });
}
