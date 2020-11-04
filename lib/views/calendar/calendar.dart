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
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return CalendarList(events: snapshot.data);
                }
                if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasData) {
                  return FutureBuilder<Subject>(
                    future: Document<Subject>(
                            path:
                                'hochschulen/${user.university}/${user.subject}')
                        .getData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<Subject> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        if (snapshot.data.supported) {
                          return SliverToBoxAdapter(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.85,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/backfall/mensa_backfall.png'),
                                ),
                              ),
                            ),
                          );
                        }
                      }
                      return SliverToBoxAdapter(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.85,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/backfall/termine_backfall_notsupported.png'),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return const SliverLoadingIndicator();
              },
            );
    }
    return SliverToBoxAdapter(
      child: Column(
        children: [
          RegisterButton(),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backfall/mensa_backfall.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
