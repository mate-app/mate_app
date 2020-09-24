import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Event {
  String id;
  String courseName;
  DateTime date;
  String degree;
  DateTime endsAt;
  List<String> groups;
  List<String> lecturers;
  String location;
  String major;
  int semester;
  DateTime startsAt;
  List<String> subjects;
  String type;

  Event(
      {this.id,
      this.courseName,
      this.date,
      this.degree,
      this.endsAt,
      this.groups,
      this.lecturers,
      this.location,
      this.major,
      this.semester,
      this.startsAt,
      this.subjects,
      this.type});
  Event.fromMap(doc) {
    id = doc.id is String ? doc.id as String : '';
    courseName = doc.data()['course_name'] is String
        ? doc.data()['course_name'] as String
        : '';
    date = doc.data()['date'].toDate() is DateTime
        ? doc.data()['date'].toDate() as DateTime
        : DateTime.utc(1970);
    degree =
        doc.data()['degree'] is String ? doc.data()['degree'] as String : '';
    endsAt = doc.data()['ends_at'].toDate() is DateTime
        ? doc.data()['ends_at'].toDate() as DateTime
        : DateTime.utc(1970);
    groups = doc.data()['groups'] is List<String>
        ? List.from(doc.data()['groups'] as List<String>)
        : [];
    lecturers = doc.data()['lecturers'] is List<String>
        ? List.from(doc.data()['lecturers'] as List<String>)
        : [];
    location = doc.data()['location'] is String
        ? doc.data()['location'] as String
        : '';
    major = doc.data()['major'] is String ? doc.data()['major'] as String : '';
    semester =
        doc.data()['semester'] is int ? doc.data()['semester'] as int : 0;
    startsAt = doc.data()['starts_at'].toDate() is DateTime
        ? doc.data()['starts_at'].toDate() as DateTime
        : DateTime.utc(1970);
    subjects = doc.data()['subjects'] is List<String>
        ? List.from(doc.data()['subjects'] as List<String>)
        : [];
    type = doc.data()['event_type'] is String
        ? doc.data()['event_type'] as String
        : '';
  }

  String get getStartsAt {
    return removeDateFromDateTime(startsAt);
  }

  String get getEndsAt {
    return removeDateFromDateTime(endsAt);
  }

  String get getDate {
    return convertDateToString(date);
  }

  dynamic get getType {
    final Map shortType = {
      'Vorlesung': 'VL', // orange
      'Seminar': 'SE', // rot
      'Übung': 'Ü', // rot
      'Wahlmodul': 'WAHL', // türkis
      'Praxis': 'Pr', // rot
      'Vorlesung/Labor': 'VL/L' // Orange
    };
    return shortType[type];
  }

  String convertDateToString(DateTime datetime) {
    initializeDateFormatting('de_DE');
    return DateFormat('dd. MMM y', 'de_DE')
        .format(DateTime.parse(datetime.toString()));
  }

  String removeDateFromDateTime(DateTime datetime) {
    initializeDateFormatting('de_DE');
    return DateFormat('', 'de_DE').add_Hm().format(datetime);
  }
}
