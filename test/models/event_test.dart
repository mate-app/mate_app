import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mateapp/models/models.dart';

void main() {
  group('Test Event Model', () {
    const docid = 'id';

    test('Should return a valid Event instance', () {
      // setup
      final mockData = {
        'course_name': 'courseName',
        'groups': ['A'],
        'subjects': ['B'],
        'lecturers': ['C', 'D'],
        'date': Timestamp.now(),
        'ends_at': Timestamp.now(),
        'starts_at': Timestamp.now(),
        'semester': 4,
        'degree': 'degree',
        'location': 'location',
        'major': 'major',
        'event_type': 'Vorlesung'
      };
      // test
      expect(Event.fromMap(docid, mockData), isInstanceOf<Event>());
      expect(Event.fromMap(docid, mockData).id, docid);
      expect(Event.fromMap(docid, mockData).courseName, 'courseName');
      expect(Event.fromMap(docid, mockData).semester, 4);
      expect(Event.fromMap(docid, mockData).groups, ['A']);
      expect(Event.fromMap(docid, mockData).subjects, ['B']);
      expect(Event.fromMap(docid, mockData).lecturers, ['C', 'D']);
      expect(Event.fromMap(docid, mockData).degree, 'degree');
      expect(Event.fromMap(docid, mockData).major, 'major');
      expect(Event.fromMap(docid, mockData).type, 'Vorlesung');
      expect(Event.fromMap(docid, mockData).shortType, 'VL');
      expect(Event.fromMap(docid, mockData).location, 'location');
      expect(Event.fromMap(docid, mockData).date, isInstanceOf<Date>());
      expect(Event.fromMap(docid, mockData).endsAt, isInstanceOf<Date>());
      expect(Event.fromMap(docid, mockData).startsAt, isInstanceOf<Date>());
    });

    test('Should return empty string when using wrong type', () {
      // setup
      final mockData = {
        'courseName': 3,
      };
      // test
      expect(Event.fromMap(docid, mockData).courseName, '');
    });

    test('Should throw AssertionError, if null given to named constructor', () {
      expect(() => Event.fromMap(null, null), throwsA(isA<AssertionError>()));
    });

    test('Should return empty String if unknown event_type is given', () {
      expect(Event(type: 'unknown').shortType, '');
    });

    test('Should return empty Event if null is given', () {
      expect(Event(), isInstanceOf<Event>());
    });
  });
}
