class Subject {
  String id;
  String name;
  String degree;
  int duration;
  String department;
  String type;
  int creditpoints;

  Subject({this.name, this.degree, this.duration, this.department, this.type});
  Subject.fromMap(doc) {
    id = doc.id;
    name = doc.data()['name'] ?? '';
    degree = doc.data()['degree'] ?? '';
    duration = doc.data()['duration'] ?? 0;
    department = doc.data()['department'] ?? '';
    type = doc.data()['type'] ?? '';
    creditpoints = doc.data()['creditpoints'] ?? 0;
  }
}
