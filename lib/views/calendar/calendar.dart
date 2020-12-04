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
                if (snapshot.hasError) {
                  return const SliverLoadingIndicator();
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverLoadingIndicator();
                }

                return StreamBuilder<Subject>(
                  stream: Document<Subject>(
                          path:
                              'hochschulen/${user.university}/subjects/${user.subject}')
                      .streamData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<Subject> subjectSnapshot) {
                    if (subjectSnapshot.hasError) {
                      return const SliverLoadingIndicator();
                    }

                    if (subjectSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const SliverLoadingIndicator();
                    }
                    if (subjectSnapshot.data.supported) {
                      if (snapshot.data.isEmpty) {
                        return SliverToBoxAdapter(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.85,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/backfall/termine_backfall_empty.png'),
                              ),
                            ),
                          ),
                        );
                      }
                      return CalendarList(events: snapshot.data);
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
              },
            );
    }
    return SliverToBoxAdapter(
      child: Column(
        children: [
          RegisterButton(),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/backfall/not_registered.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
