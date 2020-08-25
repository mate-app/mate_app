import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:mateapp/views/main/news_detail_tab.dart';
import '../../styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/services/database.dart';
import 'package:mateapp/models/news.dart';
import '../../widgets/mate_page_route.dart';

import 'news_detail_tab.dart';

class NewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<News>>.value(
      value: DatabaseService().newsStream,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: const Text('News'),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: _handleRefresh,
          ),
          NewsPanelList(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 60,
              child: Center(
                child: Text(''),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewsPanelList extends StatefulWidget {
  @override
  _NewsPanelListState createState() => _NewsPanelListState();
}

class _NewsPanelListState extends State<NewsPanelList> {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<List<News>>(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return NewsPanel(news: news[index]);
      }, childCount: news?.length ?? 0),
    );
  }
}

Future _handleRefresh() async {
  return new Future.delayed(const Duration(seconds: 1), () => {});
}

//Creates the News Panel
class NewsPanel extends StatelessWidget {
  final News news;

  // Constructor
  NewsPanel({
    Key key,
    this.news,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        Navigator.of(context).push(
          MatePageRoute(page: NewsDetailTab(news: news)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            Styles.boxShadow,
          ],
          borderRadius: Styles.roundedEdges,
          color: Styles.white,
        ),
        height: 280,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: Styles.roundedEdges,
                gradient: Styles.newsColor[news.newsCategory],
              ),
              height: 160,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 80,
                    child: Text(news.newsTitle,
                        style: Styles.h1.apply(color: Styles.white)),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Container(
                      child: Row(
                    children: <Widget>[
                      Tag(tagName: news.newsCategory),
                      Spacer(flex: 2),
                      Text(
                        news.newsDate,
                        style: Styles.tiny.apply(color: Styles.white),
                      )
                    ],
                  ))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 60,
                      child: Text(
                        news.newsShort,
                        style: Styles.font.apply(color: Styles.grey),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Styles.grey,
                            size: 30.0,
                          )
                        ],
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

//creates a Tag
class Tag extends StatelessWidget {
  final String tagName;

  // Constructor
  Tag({Key key, this.tagName = "News"});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Styles.white, width: 1.0),
          borderRadius: Styles.roundedEdges),
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.fiber_manual_record,
            color: Styles.white,
            size: 12.0,
            semanticLabel: 'dot',
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Text(
              tagName,
              style: Styles.tiny.apply(color: Styles.white),
            ),
          )
        ],
      ),
    );
  }
}
