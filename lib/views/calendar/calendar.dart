import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../services/services.dart';
import '../../shared/shared.dart';
import 'local_widgets/local_widgets.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    if (!AuthService().getUser.isAnonymous) {
      return StreamBuilder(
        stream: Collection<Event>(
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
            .streamData(),
        builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
          if (snapshot.hasData) {
            return CalendarList(events: snapshot.data);
          }
          return const SliverLoadingIndicator();
        },
      );
    }
    return SliverToBoxAdapter(
      child: RegisterButton(),
    );
  }
}
