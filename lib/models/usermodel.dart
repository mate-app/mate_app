class UserModel {
  String id;
  String language;
  String mail;
  int semester;
  String subject;
  String university;
  String department;
  List<String> upvotes;
  List<String> downvotes;
  double average;
  int credits;

  UserModel({
    this.id,
    this.language,
    this.mail,
    this.semester,
    this.subject,
    this.university,
    this.department,
    this.upvotes,
    this.downvotes,
    this.average,
    this.credits,
  });
  UserModel.fromMap(doc) {
    id = doc.id is String ? doc.id as String : '';
    language = doc.data()['language'] is String
        ? doc.data()['language'] as String
        : '';
    mail = doc.data()['mail'] is String ? doc.data()['mail'] as String : '';
    semester =
        doc.data()['semester'] is int ? doc.data()['semester'] as int : 0;
    subject =
        doc.data()['subject'] is String ? doc.data()['subject'] as String : '';
    university = doc.data()['university'] is String
        ? doc.data()['university'] as String
        : '';
    department = doc.data()['department'] is String
        ? doc.data()['department'] as String
        : '';
    upvotes = doc.data()['upvotes'] is List<String>
        ? doc.data()['upvotes'] as List<String>
        : [];
    downvotes = doc.data()['downvotes'] is List<String>
        ? doc.data()['downvotes'] as List<String>
        : [];
    average =
        doc.data()['average'] is double ? doc.data()['average'] as double : 0;
    credits = doc.data()['credit_points'] is int
        ? doc.data()['credit_points'] as int
        : 0;
  }
}
