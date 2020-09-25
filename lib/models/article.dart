import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  String author;
  String category;
  DateTime date;
  String link;
  String teaser;
  String text;
  String title;

  Article({
    this.author = 'Autor',
    this.category = 'Kategorie',
    this.date,
    this.link = 'link',
    this.teaser = 'Teaser',
    this.text = 'Text',
    this.title = 'Titel',
  });
  Article.fromMap(data) : assert(data != null) {
    author = data['author'] is String ? data['author'] as String : null;
    category = data['category'] is String ? data['category'] as String : null;
    date = data['date'] != null && data['date'] is Timestamp
        ? data['date'].toDate() as DateTime
        : null;
    link = data['link'] is String ? data['link'] as String : null;
    teaser = data['teaser'] is String ? data['teaser'] as String : null;
    text = data['text'] is String ? data['text'] as String : null;
    title = data['title'] is String ? data['title'] as String : null;
  }
}
