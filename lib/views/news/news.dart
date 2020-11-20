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
    if (user != null) {
      if (!AuthService().getUser.isAnonymous) {
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
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              return NewsList(news: snapshot.data);
            }
            return const SliverLoadingIndicator();
          },
        );
      } else {
        return StreamBuilder<List<Article>>(
          stream: Collection<Article>(
              path: 'hochschulen/${user.university}/news',
              queries: [
                CustomQuery(
                    field: 'category',
                    operation: 'whereIn',
                    value: ['Allgemein'])
              ],
              limit: 30,
              order: ['date', 'DESC']).streamData(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              return NewsList(news: snapshot.data);
            }
            if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasData) {
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
            return const SliverLoadingIndicator();
          },
        );
      }
    }
    return const SliverLoadingIndicator();
  }
}
