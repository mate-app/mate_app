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
  Event.fromMap(Map data, String id) {
    id = id;
    courseName = data['course_name'] ?? '';
    date = data['date'].toDate() ?? DateTime.utc(1970, 01, 01);
    degree = data['degree'] ?? '';
    endsAt = data['ends_at'].toDate() ?? DateTime.utc(1970, 01, 01);
    groups = List.from(data['groups']) ?? [];
    lecturers = List.from(data['lecturers']) ?? [];
    location = data['location'] ?? '';
    major = data['major'] ?? '';
    semester = data['semester'] ?? 0;
    startsAt = data['starts_at'].toDate() ?? DateTime.utc(1970, 01, 01);
    subjects = List.from(data['subjects']) ?? [];
    type = data['event_type'] ?? '';
  }
}
