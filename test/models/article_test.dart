import 'package:mateapp/models/article.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

void main() {
  group('Test Article Model', () {
    test('Should return a valid Article instance', () async {
      // populate mock database
      final firestore = MockFirestoreInstance();
      final docRef = await firestore.collection('news').add({
        'author': 'author',
        'category': 'Allgemein',
        'date': FieldValue.serverTimestamp(),
        'id': 'id',
        'link': 'link',
        'teaser': 'teaser',
        'text': 'text',
        'title': 'title',
      });

      final docSnapshot = await firestore.doc(docRef.path).get();

      expect(Article.fromMap(docSnapshot), isInstanceOf<Article>());
    });
  });
}
