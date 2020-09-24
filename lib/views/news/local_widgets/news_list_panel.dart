import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../models/models.dart';
import '../../../shared/shared.dart';
import '../../../styles/styles.dart';
import '../../../utils/utils.dart';
import '../news_article/news_article.dart';

class NewsListPanel extends StatelessWidget {
  final Article article;

  const NewsListPanel({Key key, this.article}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PlatformButton(
      padding: const EdgeInsets.all(0),
      onPressed: () {
        Navigator.push(
            context,
            platformPageRoute(
                context: context,
                builder: (context) => NewsArticle(
                      article: article,
                    )));
      },
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            MateShadows.boxShadow,
          ],
          borderRadius: MateShapes.roundedEdges,
          color: MateColors.white,
        ),
        height: 280,
        margin: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: MateShapes.roundedEdges,
                gradient: MateGradients.newsGradient[article.category] ??
                    MateGradients.newsGradient['Allgemein'],
              ),
              height: 160,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 80,
                    child: PlatformText(article.title,
                        style:
                            MateTextstyles.h1.apply(color: MateColors.white)),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Row(
                    children: <Widget>[
                      Tag(
                        tag: article.category,
                      ),
                      const Spacer(flex: 2),
                      PlatformText(
                        convertDateToString(article.date),
                        style:
                            MateTextstyles.tiny.apply(color: MateColors.white),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 60,
                      child: PlatformText(
                        article.teaser != '' ? article.teaser : article.text,
                        style:
                            MateTextstyles.font.apply(color: MateColors.grey),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Row(
                      children: const <Widget>[
                        Spacer(),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: MateColors.grey,
                          size: 30.0,
                        )
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
