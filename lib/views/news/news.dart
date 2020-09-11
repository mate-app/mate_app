import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../services/services.dart';
import '../../widgets/widgets.dart';
import 'local_widgets/local_widgets.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    if (user != null) {
      return StreamBuilder<List<Article>>(
        stream: Collection<Article>(
            path: 'hochschulen/${user.university}/news',
            queries: [
              CustomQuery(
                  field: 'category',
                  operation: 'whereIn',
                  value: ['Allgemein', user.department])
            ],
            limit: 30,
            order: ['date', 'DESC']).streamData(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            return NewsList(news: snapshot.data);
          }
          return const SliverLoadingIndicator();
        },
      );
    }
    return const SliverLoadingIndicator();
  }
}
