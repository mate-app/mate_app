class UserModel {
  String _id;
  String _language;
  String _mail;
  String _domain;
  int _semester;
  String _subject;
  String _university;
  String _department;
  List<String> _upvotes;
  List<String> _downvotes;
  double _average;
  int _creditpoints;

  UserModel(
      {String id,
      String language,
      String mail,
      String domain,
      int semester,
      String subject,
      String university,
      String department,
      List<String> upvotes,
      List<String> downvotes,
      double average,
      int creditpoints})
      : _id = id,
        _language = language,
        _mail = mail,
        _domain = domain,
        _semester = semester,
        _subject = subject,
        _university = university,
        _department = department,
        _upvotes = upvotes,
        _downvotes = downvotes,
        _average = average,
        _creditpoints = creditpoints;

  UserModel.fromMap(String docid, data) : assert(data != null) {
    id = docid;
    language = data['language'] is String ? data['language'] as String : null;
    mail = data['mail'] is String ? data['mail'] as String : null;
    domain = data['domain'] is String ? data['domain'] as String : null;
    semester = data['semester'] is int ? data['semester'] as int : null;
    subject = data['subject'] is String ? data['subject'] as String : null;
    university =
        data['university'] is String ? data['university'] as String : null;
    department =
        data['department'] is String ? data['department'] as String : null;
    upvotes = data['upvotes'] is List<String>
        ? data['upvotes'] as List<String>
        : null;
    downvotes = data['downvotes'] is List<String>
        ? data['downvotes'] as List<String>
        : null;
    average = data['average'] is double ? data['average'] as double : null;
    creditpoints =
        data['credit_points'] is int ? data['credit_points'] as int : null;
  }

  set id(String id) => _id = id;
  set language(String language) => _language = language;
  set mail(String mail) => _mail = mail;
  set domain(String domain) => _domain = domain;
  set semester(int semester) => _semester = semester;
  set subject(String subject) => _subject = subject;
  set university(String university) => _university = university;
  set department(String department) => _department = department;
  set upvotes(List<String> upvotes) => _upvotes = upvotes;
  set downvotes(List<String> downvotes) => _downvotes = downvotes;
  set average(double average) => _average = average;
  set creditpoints(int creditpoints) => _creditpoints = creditpoints;

  String get id => _id ?? '';
  String get language => _language ?? '';
  String get mail => _mail ?? '';
  String get domain => _domain ?? '';
  int get semester => _semester ?? 0;
  String get subject => _subject ?? '';
  String get university => _university ?? '';
  String get department => _department ?? '';
  List<String> get upvotes => _upvotes ?? [];
  List<String> get downvotes => _downvotes ?? [];
  double get average => _average ?? 0;
  int get creditpoints => _creditpoints ?? 0;
}
