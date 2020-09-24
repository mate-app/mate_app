class Grade {
  String id;
  String course;
  String creditPoints;
  String grade;
  String percentage;
  String semester;
  String status;
  int tries;

  Grade(
      {this.id,
      this.course,
      this.creditPoints,
      this.grade,
      this.percentage,
      this.semester,
      this.status,
      this.tries});
  Grade.fromMap(doc) {
    id = doc.id is String ? doc.id as String : '';
    course =
        doc.data()['course'] is String ? doc.data()['course'] as String : '';
    creditPoints = doc.data()['credit_points'] is String
        ? doc.data()['credit_points'] as String
        : '';
    grade = doc.data()['grade'] is String ? doc.data()['grade'] as String : '';
    percentage = doc.data()['percentage'] is String
        ? doc.data()['percentage'] as String
        : '';
    semester = doc.data()['semester'] is String
        ? doc.data()['semester'] as String
        : '';
    status =
        doc.data()['status'] is String ? doc.data()['status'] as String : '';
    tries = doc.data()['tries'] is int ? doc.data()['tries'] as int : 0;
  }
}
