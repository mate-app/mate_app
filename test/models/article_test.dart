import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mateapp/models/article.dart';

void main() {
  group('Test Article Model', () {
    test('Should return a valid Article instance', () {
      final mockData = {
        'author': 'author',
        'category': 'Allgemein',
        'date': Timestamp.now(),
      };

      expect(Article.fromMap(mockData), isInstanceOf<Article>());
      expect(Article.fromMap(mockData).author, 'author');
      expect(Article.fromMap(mockData).category, 'Allgemein');
      expect(Article.fromMap(mockData).date, isInstanceOf<DateTime>());
    });

    test('Should return sample value instead of wrong type', () {
      final mockData = {
        'link': 3,
      };
      expect(Article.fromMap(mockData).link, null);
    });

    test('Should throw AssertionError, if null given to named constructor', () {
      expect(() => Article.fromMap(null), throwsA(isA<AssertionError>()));
    });

    test('Should return sample article if no parameters are used', () {
      expect(Article(), isInstanceOf<Article>());
    });
  });
}
