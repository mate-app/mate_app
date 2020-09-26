import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mateapp/models/article.dart';

void main() {
  group('Test Article Model', () {
    test('Should return a valid Article instance', () {
      final mockData = {
        'author': 'author',
        'category': 'Allgemein',
        'teaser': 'teaser',
        'title': 'title',
        'text': 'text',
        'date': Timestamp.now(),
      };

      expect(Article.fromMap('id', mockData), isInstanceOf<Article>());
      expect(Article.fromMap('id', mockData).id, 'id');
      expect(Article.fromMap('id', mockData).author, 'author');
      expect(Article.fromMap('id', mockData).category, 'Allgemein');
      expect(Article.fromMap('id', mockData).teaser, 'teaser');
      expect(Article.fromMap('id', mockData).title, 'title');
      expect(Article.fromMap('id', mockData).text, 'text');
      expect(Article.fromMap('id', mockData).date, isInstanceOf<DateTime>());
    });

    test('Should return empty string when using wrong type', () {
      final mockData = {
        'link': 3,
      };
      expect(Article.fromMap('id', mockData).link, '');
    });

    test('Should throw AssertionError, if null given to named constructor', () {
      expect(() => Article.fromMap(null, null), throwsA(isA<AssertionError>()));
    });

    test('Should return empty article if no parameters are used', () {
      expect(Article(id: 'id'), isInstanceOf<Article>());
      expect(Article().link, '');
      expect(Article().date, null);
    });
  });
}
