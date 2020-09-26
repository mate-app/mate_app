import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mateapp/models/models.dart';

void main() {
  group('Test Dish Model', () {
    const docid = 'id';
    test('Should return a valid Dish instance', () {
      // setup
      final mockData = {
        'name': 'name',
        'tags': ['Geflügel'],
        'date': Timestamp.now(),
        'rating': 45,
        'price': '1.00'
      };
      // test
      expect(Dish.fromMap(docid, mockData), isInstanceOf<Dish>());
      expect(Dish.fromMap(docid, mockData).name, 'name');
      expect(Dish.fromMap(docid, mockData).id, docid);
      expect(Dish.fromMap(docid, mockData).price, '1.00');
      expect(Dish.fromMap(docid, mockData).rating, 45);
      expect(Dish.fromMap(docid, mockData).tags, ['Geflügel']);
      expect(Dish.fromMap(docid, mockData).date, isInstanceOf<Date>());
    });

    test('Should return empty string when using wrong type', () {
      // setup
      final mockData = {
        'name': 3,
      };
      // test
      expect(Dish.fromMap(docid, mockData).name, '');
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
