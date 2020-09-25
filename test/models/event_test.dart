import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mateapp/models/event.dart';

void main() {
  group('Test Event Model', () {
    test('Should return a valid Event instance', () {
      final mockData = {
        'course_name': 'courseName',
        'groups': ['A'],
        'date': Timestamp.now(),
        'semester': 4
      };

      expect(Event.fromMap('id', mockData), isInstanceOf<Event>());
      expect(Event.fromMap('id', mockData).courseName, 'courseName');
      expect(Event.fromMap('id', mockData).semester, 4);
      expect(Event.fromMap('id', mockData).groups, ['A']);
      expect(Event.fromMap('id', mockData).date, isInstanceOf<DateTime>());
    });

    test('Should return empty string when using wrong type', () {
      final mockData = {
        'courseName': 3,
      };
      expect(Event.fromMap('id', mockData).courseName, '');
    });

    test('Should throw AssertionError, if null given to named constructor', () {
      expect(() => Event.fromMap(null, null), throwsA(isA<AssertionError>()));
    });

    test('Should return empty Event if no parameters are used', () {
      expect(Event(), isInstanceOf<Event>());
      expect(Event().semester, 0);
      expect(Event().groups, []);
      expect(Event().date, null);
    });
  });
}
