import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../services/services.dart';
import '../../widgets/widgets.dart';
import 'local_widgets/local_widgets.dart';

class Cafeteria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    if (user != null) {
      return StreamBuilder(
        stream: Collection<Dish>(
            path: 'hochschulen/${user.university}/mensa',
            queries: [
              CustomQuery(
                  field: 'date',
                  operation: '>=',
                  value: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day)),
              CustomQuery(
                  field: 'date',
                  operation: '<=',
                  value: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 23, 59, 59))
            ]).streamData(),
        builder: (BuildContext context, AsyncSnapshot<List<Dish>> snapshot) {
          if (snapshot.hasData) {
            return CafeteriaList(dishes: snapshot.data);
          }
          return const SliverLoadingIndicator();
        },
      );
    }
    return const SliverLoadingIndicator();
  }
}
