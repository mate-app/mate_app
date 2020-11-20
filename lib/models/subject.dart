class Subject {
  String _id;
  String _name;
  String _degree;
  int _duration;
  String _department;
  String _type;
  double _creditpoints;
  bool _supported;

  Subject({
    String id,
    String name,
    String degree,
    int duration,
    String department,
    String type,
    double creditpoints,
    bool supported,
  })  : _id = id,
        _name = name,
        _degree = degree,
        _duration = duration,
        _department = department,
        _type = type,
        _creditpoints = creditpoints,
        _supported = supported;

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
    supported = data['supported'] is bool ?? false;
  }

  set id(String id) => _id = id;
  set name(String name) => _name = name;
  set degree(String degree) => _degree = degree;
  set duration(int duration) => _duration = duration;
  set department(String department) => _department = department;
  set type(String type) => _type = type;
  set creditpoints(double creditpoints) => _creditpoints = creditpoints;
  set supported(bool supported) => _supported = supported;

  String get id => _id ?? '';
  String get name => _name ?? '';
  String get degree => _degree ?? '';
  int get duration => _duration ?? 0;
  String get department => _department ?? '';
  String get type => _type ?? '';
  double get creditpoints => _creditpoints ?? 0;
  bool get supported => _supported ?? false;
}
