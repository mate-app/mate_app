class Dish {
  String id;
  String name;
  List<String> tags;
  String price;
  DateTime date;
  int rating;

  Dish({this.id, this.name, this.tags, this.price, this.date, this.rating});
  Dish.fromMap(doc) {
    id = doc.id;
    name = doc.data()['name'] ?? '';
    tags = doc.data()['tags'] != null ? List.from(doc.data()['tags']) : [];
    price = doc.data()['price'] ?? '';
    date = doc.data()['date'].toDate() ?? '';
    rating = doc.data()['rating'] ?? 0;
  }
}
