import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mateapp/models/models.dart';

void main() {
  group('Test Article Model', () {
    const docid = 'id';

    test('Should return a valid Article instance', () {
      // setup
      final mockData = {
        'author': 'author',
        'category': 'Allgemein',
        'teaser': 'teaser',
        'title': 'title',
        'text': 'text',
        'date': Timestamp.now(),
      };
      // test
      expect(Article.fromMap(docid, mockData), isInstanceOf<Article>());
      expect(Article.fromMap(docid, mockData).id, 'id');
      expect(Article.fromMap(docid, mockData).author, 'author');
      expect(Article.fromMap(docid, mockData).category, 'Allgemein');
      expect(Article.fromMap(docid, mockData).teaser, 'teaser');
      expect(Article.fromMap(docid, mockData).title, 'title');
      expect(Article.fromMap(docid, mockData).text, 'text');
      expect(Article.fromMap(docid, mockData).date, isInstanceOf<Date>());
    });

    test('Should return empty string when using wrong type', () {
      // setup
      final mockData = {
        'link': 3,
      };
      // test
      expect(Article.fromMap(docid, mockData).link, '');
    });

    test('Should throw AssertionError, if null given to named constructor', () {
      expect(() => Article.fromMap(null, null), throwsA(isA<AssertionError>()));
    });

    test('Should return empty article if no parameters are used', () {
      expect(Article(), isInstanceOf<Article>());
      expect(Article().link, '');
      expect(Article().date, isInstanceOf<Date>());
    });
  });
}
