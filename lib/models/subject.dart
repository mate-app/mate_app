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
    id = doc.id is String ? doc.id as String : '';
    name = doc.data()['name'] is String ? doc.data()['name'] as String : '';
    degree =
        doc.data()['degree'] is String ? doc.data()['degree'] as String : '';
    duration = doc.data()['duration'].toInt() is int
        ? doc.data()['duration'].toInt() as int
        : 0;
    department = doc.data()['department'] is String
        ? doc.data()['department'] as String
        : '';
    type = doc.data()['type'] is String ? doc.data()['type'] as String : '';
    creditpoints = doc.data()['creditpoints'] is double
        ? doc.data()['creditpoints'] as double
        : 0;
  }
}
