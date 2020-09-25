import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mateapp/models/Dish.dart';

void main() {
  group('Test Dish Model', () {
    test('Should return a valid Dish instance', () {
      final mockData = {
        'name': 'name',
        'tags': ['Geflügel'],
        'date': Timestamp.now(),
        'rating': 45
      };

      expect(Dish.fromMap('id', mockData), isInstanceOf<Dish>());
      expect(Dish.fromMap('id', mockData).name, 'name');
      expect(Dish.fromMap('id', mockData).rating, 45);
      expect(Dish.fromMap('id', mockData).tags, ['Geflügel']);
      expect(Dish.fromMap('id', mockData).date, isInstanceOf<DateTime>());
    });

    test('Should return empty string when using wrong type', () {
      final mockData = {
        'name': 3,
      };
      expect(Dish.fromMap('id', mockData).name, '');
    });

    test('Should throw AssertionError, if null given to named constructor', () {
      expect(() => Dish.fromMap(null, null), throwsA(isA<AssertionError>()));
    });

    test('Should return empty Dish if no parameters are used', () {
      expect(Dish(), isInstanceOf<Dish>());
      expect(Dish().rating, 0);
      expect(Dish().date, null);
    });
  });
}
