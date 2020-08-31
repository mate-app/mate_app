class Subject {
  String id;
  String name;
  String degree;
  int duration;
  String department;
  String type;
  double creditpoints;

  Subject({this.name, this.degree, this.duration, this.department, this.type});
  Subject.fromMap(doc) {
    id = doc.id;
    name = doc.data()['name'] ?? '';
    degree = doc.data()['degree'] ?? '';
    duration = doc.data()['duration'].toInt() ?? 0;
    department = doc.data()['department'] ?? '';
    type = doc.data()['type'] ?? '';
    creditpoints = doc.data()['creditpoints'] ?? 0;
  }
}
