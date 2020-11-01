import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mateapp/models/models.dart';

class Event {
  String _id;
  String _courseName;
  Date _date;
  String _degree;
  Date _endsAt;
  List<String> _groups;
  List<String> _lecturers;
  String _location;
  String _major;
  int _semester;
  Date _startsAt;
  List<String> _subjects;
  String _type;

  Event({
    String id,
    String courseName,
    Date date,
    String degree,
    Date endsAt,
    List<String> groups,
    List<String> lecturers,
    String location,
    String major,
    int semester,
    Date startsAt,
    List<String> subjects,
    String type,
  })  : _id = id,
        _courseName = courseName,
        _date = date,
        _degree = degree,
        _endsAt = endsAt,
        _groups = groups,
        _lecturers = lecturers,
        _location = location,
        _major = major,
        _semester = semester,
        _startsAt = startsAt,
        _subjects = subjects,
        _type = type;

  Event.fromMap(String docid, data) : assert(data != null) {
    id = docid;
    courseName =
        data['course_name'] is String ? data['course_name'] as String : null;
    date = data['date'] != null && data['date'] is Timestamp
        ? Date(dateTime: data['date'].toDate() as DateTime)
        : Date();
    degree = data['degree'] is String ? data['degree'] as String : null;
    endsAt = data['ends_at'] != null && data['ends_at'] is Timestamp
        ? Date(dateTime: data['ends_at'].toDate() as DateTime)
        : Date();
    groups = data['groups'] is List<String>
        ? List.from(data['groups'] as List<String>)
        : null;
    lecturers = data['lecturers'] is List<String>
        ? List.from(data['lecturers'] as List<String>)
        : null;
    location = data['location'] is String ? data['location'] as String : null;
    major = data['major'] is String ? data['major'] as String : null;
    semester = data['semester'] is int ? data['semester'] as int : null;
    startsAt = data['starts_at'] != null && data['starts_at'] is Timestamp
        ? Date(dateTime: data['starts_at'].toDate() as DateTime)
        : Date();
    subjects = data['subjects'] is List<String>
        ? List.from(data['subjects'] as List<String>)
        : null;
    type = data['event_type'] is String ? data['event_type'] as String : null;
  }

  set id(String id) => _id = id;
  set courseName(String courseName) => _courseName = courseName;
  set date(Date date) => _date = date;
  set degree(String degree) => _degree = degree;
  set endsAt(Date endsAt) => _endsAt = endsAt;
  set groups(List<String> groups) => _groups = groups;
  set lecturers(List<String> lecturers) => _lecturers = lecturers;
  set location(String location) => _location = location;
  set major(String major) => _major = major;
  set semester(int semester) => _semester = semester;
  set startsAt(Date startsAt) => _startsAt = startsAt;
  set subjects(List<String> subjects) => _subjects = subjects;
  set type(String type) => _type = type;

  String get id => _id ?? '';
  String get courseName => _courseName ?? '';
  Date get date => _date ?? Date();
  String get degree => _degree ?? '';
  Date get endsAt => _endsAt ?? Date();
  List<String> get groups => _groups ?? [];
  List<String> get lecturers => _lecturers ?? [];
  String get location => _location ?? '';
  String get major => _major ?? '';
  int get semester => _semester ?? 0;
  List<String> get subjects => _subjects ?? [];
  Date get startsAt => _startsAt ?? Date();
  String get type => _type ?? '';
  String get shortType =>
      {
        'Vorlesung': 'VL', // orange
        'Seminar': 'SE', // rot
        'Übung': 'Ü', // rot
        'Wahlmodul': 'WAHL', // türkis
        'Praxis': 'Pr', // rot
        'Vorlesung/Labor': 'VL/L' // Orange
      }[_type] ??
      '';
}
