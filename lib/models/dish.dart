import 'package:cloud_firestore/cloud_firestore.dart';

import 'models.dart';

class Dish {
  String _id;
  Date _date;
  String _name;
  String _price;
  int _rating;
  List<String> _tags;

  Dish({
    String id,
    Date date,
    String name,
    String price,
    int rating,
    List<String> tags,
  })  : _id = id,
        _name = name,
        _date = date,
        _price = price,
        _rating = rating,
        _tags = tags;

  Dish.fromMap(String docid, data) : assert(data != null) {
    id = docid;
    name = data['name'] is String ? data['name'] as String : null;
    tags =
        data['tags'] is List ? List<String>.from(data['tags'] as List) : null;
    price = data['price'] is String ? data['price'] as String : null;
    date = data['date'] != null && data['date'] is Timestamp
        ? Date(dateTime: data['date'].toDate() as DateTime)
        : Date();
    rating = data['rating'] is int ? data['rating'] as int : null;
  }

  set id(String id) => _id = id;
  set name(String name) => _name = name;
  set date(Date date) => _date = date;
  set price(String price) => _price = price;
  set rating(int rating) => _rating = rating;
  set tags(List<String> tags) => _tags = tags;

  String get id => _id ?? '';
  String get name => _name ?? '';
  Date get date => _date ?? Date();
  String get price => _price ?? '';
  int get rating => _rating ?? 0;
  List<String> get tags => _tags ?? [];
}
