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
    id = doc.id;
    courseName = doc.data()['course_name'] ?? '';
    date = doc.data()['date'].toDate() ?? DateTime.utc(1970, 01, 01);
    degree = doc.data()['degree'] ?? '';
    endsAt = doc.data()['ends_at'].toDate() ?? DateTime.utc(1970, 01, 01);
    groups =
        doc.data()['groups'] != null ? List.from(doc.data()['groups']) : [];
    lecturers = doc.data()['lecturers'] != null
        ? List.from(doc.data()['lecturers'])
        : [];
    location = doc.data()['location'] ?? '';
    major = doc.data()['major'] ?? '';
    semester = doc.data()['semester'] ?? 0;
    startsAt = doc.data()['starts_at'].toDate() ?? DateTime.utc(1970, 01, 01);
    subjects =
        doc.data()['subjects'] != null ? List.from(doc.data()['subjects']) : [];
    type = doc.data()['event_type'] ?? '';
  }

  get getStartsAt {
    return removeDateFromDateTime(startsAt);
  }

  get getEndsAt {
    return removeDateFromDateTime(endsAt);
  }

  get getDate {
    return convertDateToString(date);
  }

  get getType {
    Map shortType = {
      'Vorlesung': 'VL',
      'Seminar': 'SE',
      'Wahlmodul': 'WAHL',
      'Praxis': 'PR',
      'Übung': 'Ü',
      'Forschungsprojekt': 'FPR',
      'Vorlesung/Labor': 'VL/L'
    };
    return shortType[type];
  }

  String convertDateToString(DateTime datetime) {
    initializeDateFormatting('de_DE', null);
    return DateFormat('dd. MMM y', 'de_DE')
        .format(DateTime.parse(datetime.toString()));
  }

  String removeDateFromDateTime(DateTime datetime) {
    initializeDateFormatting('de_DE', null);
    return DateFormat('', 'de_DE').add_Hm().format(datetime);
  }
}
