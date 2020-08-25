import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mateapp/models/news.dart';
import 'package:mateapp/models/university.dart';
import 'package:mateapp/models/subject.dart';
import 'package:mateapp/models/dish.dart';

class DatabaseService {
  final String uid;

  // Constructer
  DatabaseService({this.uid});

  // University Collection
  final CollectionReference universityCollection =
      Firestore.instance.collection('hochschulen');

  // news Collection
  final CollectionReference newsCollection = Firestore.instance
      .collection('hochschulen')
      .document('fhkiel')
      .collection('news');

  // user Collection
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  // moduls Collection
  final CollectionReference subjectCollection = Firestore.instance
      .collection('hochschulen')
      .document('fhkiel')
      .collection('subjects');

  // Dishes Collection
  final CollectionReference dishCollection = Firestore.instance
      .collection('hochschulen')
      .document('fhkiel')
      .collection('mensa');

  // List of Dishes from Snapshot
  List<Dish> _dishListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Dish(
          id: doc.documentID,
          name: doc.data['name'] ?? '',
          tags: doc.data['tags'] ?? [],
          price: doc.data['price'] ?? '',
          date: _convertDateToString(doc.data['date']) ?? '',
          rating: doc.data['rating'] ?? 0);
    }).toList();
  }

  // List of News from Snapshot
  List<News> _newsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return News(
          newsId: doc.data['id'],
          newsCategory: doc.data['category'] ?? '',
          newsDate: _convertDateToString(doc.data['date']) ?? '',
          newsShort: doc.data['teaser'] ?? '',
          newsTitle: doc.data['title'] ?? '');
    }).toList();
  }

  // List of Subjects from Snapshot
  List<Subject> _subjectListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Subject(
        name: doc.data['name'] ?? '',
        degree: doc.data['degree'] ?? '',
        duration: doc.data['duration'] ?? 6,
        department: doc.data['department'] ?? '',
        type: doc.data['type'] ?? '',
      );
    }).toList();
  }

  // List of Universities from Snapshopt
  List<University> _universityListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return University(
          name: doc.data['name'] ?? '',
          emailDomain: doc.data['domain'] ?? '',
          city: doc.data['city'] ?? '',
          shortName: doc.data['short_name'] ?? '');
    }).toList();
  }

  // University Stream
  Stream<List<University>> get universityStream {
    return universityCollection.snapshots().map(_universityListFromSnapshot);
  }

  // newsStream
  Stream<List<News>> get newsStream {
    return newsCollection
        .orderBy('date', descending: true)
        .snapshots()
        .map(_newsListFromSnapshot);
  }

  // subject Stream
  Stream<List<Subject>> get subjectStream {
    return subjectCollection.snapshots().map(_subjectListFromSnapshot);
  }

  //Dishes Stream
  Stream<List<Dish>> get dishStream {
    return dishCollection
        .where("date",
            isGreaterThanOrEqualTo: DateTime(DateTime.now().year,
                DateTime.now().month, DateTime.now().day, 0, 0))
        .where("date",
            isLessThanOrEqualTo: DateTime(DateTime.now().year,
                DateTime.now().month, DateTime.now().day, 23, 59, 59))
        .snapshots()
        .map(_dishListFromSnapshot);
  }

  // Converts Timestamps to usable String Format
  String _convertDateToString(Timestamp timestamp) {
    initializeDateFormatting('de_DE', null);
    return DateFormat('dd. MMM y', 'de_DE')
        .format(DateTime.parse(timestamp.toDate().toString()));
  }

  // Functions updates standard user data
  Future updateUserData(
    String uid,
    String mail,
    String university,
    String subject,
    int semester,
    String language,
  ) async {
    return await userCollection.document(uid).setData({
      'user_id': uid,
      'mail': mail,
      'university': university,
      'subject': subject,
      'semester': semester,
      'language': language
    });
  }
}
