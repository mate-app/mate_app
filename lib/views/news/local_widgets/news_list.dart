import 'package:flutter/material.dart';

import '../../../models/models.dart';
import 'local_widgets.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList({Key key, this.news}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return NewsListPanel(article: news[index]);
      }, childCount: news?.length ?? 0),
    );
  }
}
