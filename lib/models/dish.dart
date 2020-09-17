class Dish {
  String id;
  String name;
  List<String> tags;
  String price;
  DateTime date;
  int rating;

  Dish({this.id, this.name, this.tags, this.price, this.date, this.rating});
  Dish.fromMap(doc) {
    id = doc.id is String ? doc.id as String : '';
    name = doc.data()['name'] is String ? doc.data()['name'] as String : '';
    tags = doc.data()['tags'] is List
        ? List<String>.from(doc.data()['tags'] as List)
        : [];
    price = doc.data()['price'] is String ? doc.data()['price'] as String : '';
    date = doc.data()['date'].toDate() is DateTime
        ? doc.data()['date'].toDate() as DateTime
        : DateTime.utc(1970);
    rating = doc.data()['rating'] is int ? doc.data()['rating'] as int : 0;
  }
}
