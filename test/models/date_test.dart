import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/models/models.dart';

void main() {
  group('Test Date Model', () {
    test('Should return valid Date Instance', () {
      // setup
      final date = DateTime.now();
      // test
      expect(Date(dateTime: date), isInstanceOf<Date>());
      expect(Date(dateTime: date).asString, isInstanceOf<String>());
      expect(Date(dateTime: date).onlyTime, isInstanceOf<String>());
    });

    test('Should return valid Date Instance when given null', () {
      expect(Date(), isInstanceOf<Date>());
      expect(Date().asString, '');
      expect(Date().onlyTime, '');
    });
  });
}
