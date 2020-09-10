import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../styles/styles.dart';
import '../../../widgets/widgets.dart';
import 'local_widgets/local_widgets.dart';

class NewsArticle extends StatelessWidget {
  final Article article;

  const NewsArticle({Key key, this.article}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MateColors.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar('Mitteilung'),
            pinned: true,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            NewsArticlePanel(
              article: article,
            ),
            NewsArticleContent(
              article: article,
            )
          ])),
        ],
      ),
    );
  }
}
