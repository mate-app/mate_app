import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  String _id;
  String _author;
  String _category;
  DateTime date;
  String _link;
  String _teaser;
  String _text;
  String _title;

  Article({
    String id,
    String author,
    String category,
    this.date,
    String link,
    String teaser,
    String text,
    String title,
  })  : _id = id,
        _author = author,
        _category = category,
        _link = link,
        _teaser = teaser,
        _text = text,
        _title = title;

  Article.fromMap(String id, data) : assert(data != null) {
    id = id is String ? id : null;
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

  set id(String id) => _id = id;
  set author(String author) => _author = author;
  set category(String category) => _category = category;
  set link(String link) => _link = link;
  set teaser(String teaser) => _teaser = teaser;
  set text(String text) => _text = text;
  set title(String title) => _title = title;

  String get id => _id?.toString() ?? '';
  String get author => _author?.toString() ?? '';
  String get category => _category?.toString() ?? '';
  String get link => _link?.toString() ?? '';
  String get teaser => _teaser?.toString() ?? '';
  String get text => _text?.toString() ?? '';
  String get title => _title?.toString() ?? '';
}
