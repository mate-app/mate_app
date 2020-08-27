import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/services/services.dart';
import 'package:mateapp/widgets/widgets.dart';
import 'package:mateapp/utils/utils.dart';

// TODO: remove import and use inheritance
import '../../styles/styles.dart';

class MensaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);

    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: const Text('Mensa'),
        ),
        CupertinoSliverRefreshControl(
          onRefresh: handleRefresh,
        ),
        user == null
            ? SliverLoadingIndicator()
            : StreamBuilder(
                stream: Collection<Dish>(
                    path: 'hochschulen/${user.university}/mensa',
                    queries: [
                      CustomQuery(
                          field: 'date',
                          operation: '>=',
                          value: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day, 0, 0)),
                      CustomQuery(
                          field: 'date',
                          operation: '<=',
                          value: DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                              23,
                              59,
                              59))
                    ]).streamData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.hasError) {
                    return SliverLoadingIndicator();
                  }
                  return MensaPanelList(snapshot.data);
                },
              ),
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

class MensaPanelList extends StatefulWidget {
  final List<Dish> dishes;

  MensaPanelList(this.dishes);

  @override
  _MensaPanelListState createState() => _MensaPanelListState();
}

class _MensaPanelListState extends State<MensaPanelList> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return MensaPanel(dish: widget.dishes[index]);
      }, childCount: widget.dishes?.length ?? 0),
    );
  }
}

//Creates the Mensa Panel
class MensaPanel extends StatefulWidget {
  final Dish dish;

  // Constructor
  MensaPanel({Key key, this.dish});

  @override
  _MensaPanelState createState() => _MensaPanelState();
}

class _MensaPanelState extends State<MensaPanel> {
  bool upvoted = false;
  bool downvoted = false;
  bool _btnEnabled = true;

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);

    if (user.downvotes.contains(widget.dish.id)) {
      setState(() {
        downvoted = true;
      });
    }
    if (user.upvotes.contains(widget.dish.id)) {
      setState(() {
        upvoted = true;
      });
    }

    List<dynamic> tags = widget.dish.tags.length > 3
        ? widget.dish.tags.sublist(0, 3)
        : widget.dish.tags;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          Styles.boxShadow,
        ],
        borderRadius: Styles.roundedEdges,
        gradient: Styles.gradientPrimary,
      ),
      height: 210,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                  minWidth: 150,
                  maxWidth: MediaQuery.of(context).size.width * 0.64,
                ),
                height: 100,
                child: Text(widget.dish.name,
                    style: Styles.h2.apply(color: Styles.white)),
              ),
              Spacer(
                flex: 2,
              ),
              Container(
                  height: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [for (var i in tags) Tag(tag: i)],
                      ),
                      Text(
                        widget.dish.price + ' €',
                        style: Styles.small.apply(color: Styles.white),
                      )
                    ],
                  ))
            ],
          ),
          Spacer(),
          Column(
            children: <Widget>[
              Spacer(),
              CupertinoButton(
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    color: upvoted ? Colors.white54 : Styles.white,
                    size: 40.0,
                  ),
                  onPressed: _btnEnabled
                      ? () async {
                          // // rating + 1
                          setState(() {
                            _btnEnabled = false;
                          });
                          if (downvoted) return;
                          Map increment;
                          Map userVotes;
                          if (upvoted) {
                            increment = {
                              'rating': FieldValue.increment(-1),
                            };
                            userVotes = {
                              'votes': FieldValue.arrayRemove([widget.dish.id]),
                            };
                          } else {
                            increment = {
                              'rating': FieldValue.increment(1),
                            };
                            userVotes = {
                              'votes': FieldValue.arrayUnion([widget.dish.id]),
                            };
                          }
                          await Document(
                                  path:
                                      'hochschulen/${user.university}/mensa/${widget.dish.id}')
                              .upsert(increment);
                          await UserData(collection: 'users')
                              .upsert(userVotes)
                              .then((value) {
                            setState(() {
                              upvoted = upvoted ? false : true;
                              _btnEnabled = true;
                            });
                          });
                        }
                      : null),
              Text(
                widget.dish.rating.toString(),
                style: Styles.h2.apply(color: Styles.white),
              ),
              CupertinoButton(
                padding: EdgeInsets.all(0),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  // TODO: change upvote and downvote color for arrow to something nice
                  color: downvoted ? Colors.white54 : Styles.white,
                  size: 40.0,
                ),
                onPressed: _btnEnabled
                    ? () {
                        setState(() {
                          _btnEnabled = false;
                        });
                        // rating + 1
                        if (upvoted) return;
                        Map increment;
                        Map userVotes;
                        if (downvoted) {
                          increment = {
                            'rating': FieldValue.increment(1),
                          };
                          userVotes = {
                            'votes': FieldValue.arrayRemove([widget.dish.id]),
                          };
                        } else {
                          increment = {
                            'rating': FieldValue.increment(-1),
                          };
                          userVotes = {
                            'votes': FieldValue.arrayUnion([widget.dish.id]),
                          };
                        }
                        Document(
                                path:
                                    'hochschulen/${user.university}/mensa/${widget.dish.id}')
                            .upsert(increment);
                        UserData(collection: 'users')
                            .upsert(userVotes)
                            .then((value) {
                          setState(() {
                            downvoted = downvoted ? false : true;
                            _btnEnabled = true;
                          });
                        });
                        ;
                      }
                    : null,
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
