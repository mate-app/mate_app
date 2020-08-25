class Dish {
  final String id;
  final String name;
  final List<dynamic> tags;
  final String price;
  final String date;
  int rating;

  Dish(
      {this.id = '',
      this.name = '',
      this.tags = const ['tag'],
      this.price = '',
      this.date = '',
      this.rating = 0});
}
