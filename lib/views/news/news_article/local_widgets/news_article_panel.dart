import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../models/models.dart';
import '../../../../shared/shared.dart';
import '../../../../styles/styles.dart';

class NewsArticlePanel extends StatelessWidget {
  final Article article;

  const NewsArticlePanel({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: MateShapes.roundedEdges,
        gradient: MateGradients.newsGradient[article.category],
      ),
      height: 160,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 80,
            child: PlatformText(article.title,
                style: MateTextstyles.h1.apply(color: MateColors.white)),
          ),
          const Spacer(
            flex: 2,
          ),
          Row(
            children: <Widget>[
              Tag(
                tag: article.category,
              ),
            ],
          )
        ],
      ),
    );
  }
}
