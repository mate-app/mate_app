import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/models.dart';
import '../../services/services.dart';
import '../../shared/shared.dart';
import 'local_widgets/local_widgets.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    CustomQuery query;

    if (user == null) {
      return const ErrorMessage();
    }
    if (!AuthService().getUser.isAnonymous) {
      query = CustomQuery(
          field: 'category',
          operation: 'whereIn',
          value: ['Allgemein', user.department]);
    } else {
      query = CustomQuery(
          field: 'category', operation: 'whereIn', value: ['Allgemein']);
    }
    return StreamBuilder<List<Article>>(
      stream: Collection<Article>(
          path: 'hochschulen/${user.university}/news',
          queries: [
            query,
          ],
          limit: 30,
          order: ['date', 'DESC']).streamData(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasError) {
          return const ErrorMessage();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverLoadingIndicator();
        }

        if (snapshot.data.isEmpty) {
          return SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/backfall/news_backfall.png'),
                ),
              ),
            ),
          );
        }

        return NewsList(news: snapshot.data);
      },
    );
  }
}
