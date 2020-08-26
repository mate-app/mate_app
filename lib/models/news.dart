class News {
  String id;
  String title;
  String teaser;
  String category;
  DateTime date;
  String author;
  String link;
  String text;

  News(
      {this.id,
      this.title,
      this.teaser,
      this.category,
      this.date,
      this.text,
      this.author});
  News.fromMap(doc) {
    id = doc.id;
    title = doc.data()['title'] ?? '';
    teaser = doc.data()['teaser'] ?? '';
    category = doc.data()['category'] ?? '';
    date = doc.data()['date'].toDate() ?? DateTime.utc(1970, 01, 01);
    author = doc.data()['author'] ?? '';
    link = doc.data()['link'] ?? '';
    text = doc.data()['text'] ?? '';
  }
}
