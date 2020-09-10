import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../models/models.dart';
import '../../../../styles/styles.dart';
import '../../../../utils/utils.dart';

class NewsArticleContent extends StatelessWidget {
  final Article article;

  const NewsArticleContent({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Essential Links
          Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: MateColors.grey,
              )),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  article.author,
                  style: MateTextstyles.small.apply(color: MateColors.grey),
                ),
                const Spacer(),
                Text(convertDateToString(article.date),
                    style: MateTextstyles.small.apply(color: MateColors.grey)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: Text(
              article.teaser,
              style: MateTextstyles.font.apply(color: MateColors.grey),
              // textAlign: TextAlign.justify,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: Text(
              article.text,
              style: MateTextstyles.font.apply(color: MateColors.grey),
              // textAlign: TextAlign.justify,
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: PlatformButton(
                padding: EdgeInsets.zero,
                onPressed: () => launchURL(article.link),
                child: PlatformText('zur Webseite'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
