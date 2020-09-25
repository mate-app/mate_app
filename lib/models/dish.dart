import 'package:cloud_firestore/cloud_firestore.dart';

class Dish {
  String _id;
  DateTime date;
  String _name;
  String _price;
  int _rating;
  List<String> _tags;

  Dish({
    String id,
    this.date,
    String name,
    String price,
    int rating,
    List<String> tags,
  })  : _id = id,
        _name = name,
        _price = price,
        _rating = rating,
        _tags = tags;

  Dish.fromMap(String id, data) : assert(data != null) {
    id = id is String ? id : null;
    name = data['name'] is String ? data['name'] as String : null;
    tags = data['tags'] is List ? List<String>.from(data['tags'] as List) : [];
    price = data['price'] is String ? data['price'] as String : null;
    date = data['date'] != null && data['date'] is Timestamp
        ? data['date'].toDate() as DateTime
        : null;
    rating = data['rating'] is int ? data['rating'] as int : null;
  }

  set id(String id) => _id = id;
  set name(String name) => _name = name;
  set price(String price) => _price = price;
  set rating(int rating) => _rating = rating;
  set tags(List<String> tags) => _tags = tags;

  String get id => _id?.toString() ?? '';
  String get name => _name?.toString() ?? '';
  String get price => _price?.toString() ?? '';
  int get rating => _rating ?? 0;
  List<String> get tags => _tags ?? [];
}
