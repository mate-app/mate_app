import 'package:mateapp/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/views/views.dart';
import 'package:mateapp/services/services.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/utils/utils.dart';

// TODO: remove import and use inheritance
import '../../styles/styles.dart';

class NewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);

    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: const Text('News'),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: handleRefresh,
        ),
        user == null
            ? SliverLoadingIndicator()
            : StreamBuilder<Object>(
                stream: Collection<News>(
                    path: 'hochschulen/${user.university}/news',
                    queries: [
                      CustomQuery(
                          field: 'category',
                          operation: 'whereIn',
                          value: ['Allgemein', user.department])
                    ],
                    limit: 30,
                    order: ['date', 'DESC']).streamData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.hasError) {
                    return SliverLoadingIndicator();
                  }

                  return NewsPanelList(snapshot.data);
                }),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
            child: Center(
              child: Text(''),
            ),
          ),
        ),
      ],
    );
  }
}

class NewsPanelList extends StatefulWidget {
  final List<News> news;

  NewsPanelList(this.news);

  @override
  _NewsPanelListState createState() => _NewsPanelListState();
}

class _NewsPanelListState extends State<NewsPanelList> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return NewsPanel(news: widget.news[index]);
      }, childCount: widget.news?.length ?? 0),
    );
  }
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
          CupertinoPageRoute(builder: (context) => NewsDetailTab(news: news)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            MateShadows.boxShadow,
          ],
          borderRadius: MateShapes.roundedEdges,
          color: MateColors.white,
        ),
        height: 280,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: MateShapes.roundedEdges,
                gradient: MateGradients.newsGradient[news.category] ??
                    MateGradients.newsGradient['Allgemein'],
              ),
              height: 160,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 80,
                    child: Text(news.title,
                        style:
                            MateTextstyles.h1.apply(color: MateColors.white)),
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
                      Spacer(flex: 2),
                      Text(
                        convertDateToString(news.date),
                        style:
                            MateTextstyles.tiny.apply(color: MateColors.white),
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
                        news.teaser != '' ? news.teaser : news.text,
                        style:
                            MateTextstyles.font.apply(color: MateColors.grey),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: MateColors.grey,
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
