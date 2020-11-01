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

    test('Should be two different instances', () {
      final date1 = Date();
      final date2 = Date();

      expect(date1 == date2, true);
    });

    test('Should return same hashcode', () {
      final date1 = Date();
      final date2 = Date();

      expect(date1.hashCode == date2.hashCode, true);
    });
  });
}
