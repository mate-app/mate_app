import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/utils/utils.dart';
import 'package:mateapp/widgets/widgets.dart';
// TODO: remove import and use inheritance
import '../../styles/styles.dart';

class NewsDetailTab extends StatefulWidget {
  final News news;

  // Constructor
  NewsDetailTab({Key key, @required this.news}) : super(key: key);

  @override
  _NewsDetailTab createState() => _NewsDetailTab();
}

// TODO: kleine Leiste ohne bounce effekt implementieren
class _NewsDetailTab extends State<NewsDetailTab> {
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
            NewsDetailPanel(
              news: widget.news,
            ),
            NewsDetailText(
              news: widget.news,
            )
          ])),
        ],
      ),
    );
  }
}

class NewsDetailPanel extends StatelessWidget {
  final News news;

  // Constructor
  NewsDetailPanel({
    Key key,
    this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: MateShapes.roundedEdges,
        gradient: MateGradients.newsGradient[news.category],
      ),
      height: 160,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 80,
            child: Text(news.title,
                style: MateTextstyles.h1.apply(color: MateColors.white)),
          ),
          Spacer(
            flex: 2,
          ),
          Container(
              child: Row(
            children: <Widget>[
              Tag(
                tag: news.category,
                margin_bottom: 0,
                margin_right: 0,
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class NewsDetailText extends StatelessWidget {
  final News news;

  // Constructor
  NewsDetailText({
    Key key,
    this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Essential Links
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                width: 1.0,
                color: MateColors.grey,
              )),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  news.author,
                  style: MateTextstyles.small.apply(color: MateColors.grey),
                ),
                Spacer(),
                Text(convertDateToString(news.date),
                    style: MateTextstyles.small.apply(color: MateColors.grey)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: Text(
              news.teaser,
              style: MateTextstyles.font.apply(color: MateColors.grey),
              // textAlign: TextAlign.justify,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
            child: Text(
              news.text,
              style: MateTextstyles.font.apply(color: MateColors.grey),
              // textAlign: TextAlign.justify,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text('zur Webseite'),
                onPressed: () => launchURL(news.link),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
