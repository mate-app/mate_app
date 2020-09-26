class Subject {
  String _id;
  String _name;
  String _degree;
  int _duration;
  String _department;
  String _type;
  double _creditpoints;

  Subject({
    String id,
    String name,
    String degree,
    int duration,
    String department,
    String type,
    double creditpoints,
  })  : _id = id,
        _name = name,
        _degree = degree,
        _duration = duration,
        _department = department,
        _type = type,
        _creditpoints = creditpoints;

  Subject.fromMap(String docid, data) : assert(data != null) {
    id = docid;
    name = data['name'] is String ? data['name'] as String : null;
    degree = data['degree'] is String ? data['degree'] as String : null;
    duration = data['duration'] is num ? data['duration'].toInt() as int : 0;
    department =
        data['department'] is String ? data['department'] as String : null;
    type = data['type'] is String ? data['type'] as String : null;
    creditpoints =
        data['creditpoints'] is double ? data['creditpoints'] as double : null;
  }

  set id(String id) => _id = id;
  set name(String name) => _name = name;
  set degree(String degree) => _degree = degree;
  set duration(int duration) => _duration = duration;
  set department(String department) => _department = department;
  set type(String type) => _type = type;
  set creditpoints(double creditpoints) => _creditpoints = creditpoints;

  String get id => _id ?? '';
  String get name => _name ?? '';
  String get degree => _degree ?? '';
  int get duration => _duration ?? 0;
  String get department => _department ?? '';
  String get type => _type ?? '';
  double get creditpoints => _creditpoints ?? 0;
}
