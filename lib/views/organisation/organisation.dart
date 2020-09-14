import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../services/services.dart';
import '../../widgets/widgets.dart';
import 'local_widgets/local_widgets.dart';

class Organisation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    if (!AuthService().getUser.isAnonymous) {
      return SliverList(
        delegate: SliverChildListDelegate(
          [
            StreamBuilder(
              stream: Document<University>(
                path: 'hochschulen/${user.university}',
              ).streamData(),
              builder:
                  (BuildContext context, AsyncSnapshot<University> snapshot) {
                if (snapshot.hasData) {
                  return OrganisationPanel(
                      user: user, university: snapshot.data);
                }
                return const SliverLoadingIndicator();
              },
            ),
            OrganisationList(),
          ],
        ),
      );
    }
    return const SliverLoadingIndicator();
  }
}
