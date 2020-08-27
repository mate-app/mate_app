import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/views/views.dart';

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
    // final news = Provider.of<List<News>>(context);
    return Container(
      color: Styles.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar(),
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

class StaticNavigationBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: CupertinoNavigationBar(
        middle: Container(
          child: Text(
            'Mitteilung',
            style: TextStyle(
              fontSize: 15.5,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 64.0;

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
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
        borderRadius: Styles.roundedEdges,
        gradient: Styles.newsColor[news.category],
      ),
      height: 160,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 80,
            child:
                Text(news.title, style: Styles.h1.apply(color: Styles.white)),
          ),
          Spacer(
            flex: 2,
          ),
          Container(
              child: Row(
            children: <Widget>[
              Tag(tagName: news.category),
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
      margin: EdgeInsets.fromLTRB(20, 20, 20, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //Essential Links
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                width: 1.0,
                color: Styles.grey,
              )),
            ),
            child: Row(
              children: <Widget>[
                Text("", style: Styles.small.apply(color: Styles.grey)),
                Spacer(),
                Text(news.date.toString(),
                    style: Styles.small.apply(color: Styles.grey)),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
              child: Text(
                news.teaser,
                style: Styles.font.apply(color: Styles.grey),
                // textAlign: TextAlign.justify,
              ))
        ],
      ),
    );
  }
}
