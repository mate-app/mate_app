class Grade {
  String _id;
  String _course;
  String _creditPoints;
  String _grade;
  String _percentage;
  String _semester;
  String _status;
  int _tries;

  Grade(
      {String id,
      String course,
      String creditPoints,
      String grade,
      String percentage,
      String semester,
      String status,
      int tries})
      : _id = id,
        _course = course,
        _creditPoints = creditPoints,
        _grade = grade,
        _percentage = percentage,
        _semester = semester,
        _status = status,
        _tries = tries;

  Grade.fromMap(String docid, data) : assert(data != null) {
    id = docid is String ? docid : null;
    course = data['course'] is String ? data['course'] as String : null;
    creditPoints = data['credit_points'] is String
        ? data['credit_points'] as String
        : null;
    grade = data['grade'] is String ? data['grade'] as String : null;
    percentage =
        data['percentage'] is String ? data['percentage'] as String : null;
    semester = data['semester'] is String ? data['semester'] as String : null;
    status = data['status'] is String ? data['status'] as String : null;
    tries = data['tries'] is int ? data['tries'] as int : null;
  }

  set id(String id) => _id = id;
  set course(String course) => _course = course;
  set creditPoints(String creditPoints) => _creditPoints = creditPoints;
  set grade(String grade) => _grade = grade;
  set percentage(String percentage) => _percentage = percentage;
  set semester(String semester) => _semester = semester;
  set status(String status) => _status = status;
  set tries(int tries) => _tries = tries;

  String get id => _id ?? '';
  String get course => _course ?? '';
  String get creditPoints => _creditPoints ?? '';
  String get grade => _grade ?? '';
  String get percentage => _percentage ?? '';
  String get semester => _semester ?? '';
  String get status => _status ?? '';
  int get tries => _tries ?? 0;
}
