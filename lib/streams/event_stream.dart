import 'package:mateapp/models/models.dart';
import 'package:mateapp/services/services.dart';

class EventStream {
  final UserModel user;

  EventStream({this.user});

  Stream<List<Event>> get stream {
    return Collection<Event>(
            path: 'hochschulen/${user.university}/events',
            queries: [
              CustomQuery(
                field: 'subjects',
                operation: 'arrayContains',
                value: user.subject,
              ),
              CustomQuery(
                field: 'semester',
                operation: '==',
                value: user.semester,
              )
            ],
            order: ['starts_at', 'ASC'],
            limit: 200)
        .streamData();
  }
}
