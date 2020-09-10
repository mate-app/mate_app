class Article {
  String id;
  String title;
  String teaser;
  String category;
  DateTime date;
  String author;
  String link;
  String text;

  Article(
      {this.id,
      this.title,
      this.teaser,
      this.category,
      this.date,
      this.text,
      this.author});
  Article.fromMap(doc) {
    id = doc.id is String ? doc.id as String : '';
    title = doc.data()['title'] is String ? doc.data()['title'] as String : '';
    teaser =
        doc.data()['teaser'] is String ? doc.data()['teaser'] as String : '';
    category = doc.data()['category'] is String
        ? doc.data()['category'] as String
        : '';
    date = doc.data()['date'].toDate() is DateTime
        ? doc.data()['date'].toDate() as DateTime
        : DateTime.utc(1970);
    author =
        doc.data()['author'] is String ? doc.data()['author'] as String : '';
    link = doc.data()['link'] is String ? doc.data()['link'] as String : '';
    text = doc.data()['text'] is String ? doc.data()['text'] as String : '';
  }
}
