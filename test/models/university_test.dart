import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mateapp/models/models.dart';

void main() {
  group('Test University Model', () {
    const docid = 'id';

    test('Should return University Instance', () {
      // setup
      final mockData = {
        'id': 'id',
        'city': 'city',
        'domain': 'domain',
        'mail': 'mail',
        'name': 'name',
        'short_name': 'shortName',
        'street': 'street',
        'tel': 'tel',
        'website': 'website',
        'zip': 'zip',
        'next_holidays': Timestamp.now(),
      };
      // test
      expect(University.fromMap(docid, mockData), isInstanceOf<University>());
      expect(University.fromMap(docid, mockData).id, 'id');
      expect(University.fromMap(docid, mockData).city, 'city');
      expect(University.fromMap(docid, mockData).domain, 'domain');
      expect(University.fromMap(docid, mockData).mail, 'mail');
      expect(University.fromMap(docid, mockData).name, 'name');
      expect(University.fromMap(docid, mockData).shortName, 'shortName');
      expect(University.fromMap(docid, mockData).street, 'street');
      expect(University.fromMap(docid, mockData).tel, 'tel');
      expect(University.fromMap(docid, mockData).website, 'website');
      expect(University.fromMap(docid, mockData).zip, 'zip');
      expect(University.fromMap(docid, mockData).nextHolidays,
          isInstanceOf<Date>());
    });

    test('Should return empty string when using wrong type', () {
      // setup
      final mockData = {
        'name': 453,
      };
      // test
      expect(University.fromMap(docid, mockData).name, '');
    });

    test('Should throw AssertionError, if null given to named constructor', () {
      expect(
          () => University.fromMap(null, null), throwsA(isA<AssertionError>()));
    });

    test('Should return empty University if null is given', () {
      expect(University(), isInstanceOf<University>());
    });
  });
}
