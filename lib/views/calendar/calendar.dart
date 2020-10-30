import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../services/services.dart';
import '../../shared/shared.dart';
import '../../streams/streams.dart';
import 'local_widgets/local_widgets.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    if (!AuthService().getUser.isAnonymous) {
      return user == null
          ? const SliverLoadingIndicator()
          : StreamBuilder<List<Event>>(
              stream: EventStream(user: user).stream,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
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
