class Event {
  final String date;
  final String name;
  final String start;
  final String end;
  final String location;
  final String type;
  final int count;
  final int appointmentCount;

  Event({
    this.name = "Mediennutungs und Rezeptionsforschung",
    this.start = "Start",
    this.end = "Ende",
    this.location = "Ort",
    this.type = "OA",
    this.date = "Datum",
    this.count = 2,
    this.appointmentCount = 3,
  });
}
