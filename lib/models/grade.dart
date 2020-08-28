class Grade {
  String id;
  String course;
  int creditPoints;
  String grade;
  int percentage;
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
      this.status});
  Grade.fromMap(doc) {
    id = doc.id;
    course = doc.data()['course'] ?? '';
    creditPoints = doc.data()['credit_points'] ?? 0;
    grade = doc.data()['grade'] ?? '';
    percentage = doc.data()['percentage'] ?? 0;
    semester = doc.data()['semester'] ?? '';
    status = doc.data()['status'] ?? '';
    tries = doc.data()['tries'] ?? 0;
  }
}
