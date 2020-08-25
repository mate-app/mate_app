import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import '../../styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/models/dish.dart';
import 'package:mateapp/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MensaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Dish>>.value(
      value: DatabaseService().dishStream,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: const Text('Mensa'),
          ),
          CupertinoSliverRefreshControl(
            onRefresh: _handleRefresh,
          ),
          MensaPanelList(),
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

class MensaPanelList extends StatefulWidget {
  @override
  _MensaPanelListState createState() => _MensaPanelListState();
}

class _MensaPanelListState extends State<MensaPanelList> {
  @override
  Widget build(BuildContext context) {
    final dishes = Provider.of<List<Dish>>(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return MensaPanel(dish: dishes[index]);
      }, childCount: dishes?.length ?? 0),
    );
  }
}

Future _handleRefresh() async {
  return new Future.delayed(const Duration(seconds: 1), () => {});
}

//Creates the Mensa Panel
class MensaPanel extends StatelessWidget {
  final Dish dish;

  // Constructor
  MensaPanel({Key key, this.dish});

  @override
  Widget build(BuildContext context) {
    List<dynamic> tags =
        dish.tags.length > 3 ? dish.tags.sublist(0, 3) : dish.tags;

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
                child: Text(dish.name,
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
                        dish.price + ' €',
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
                    color: Styles.white,
                    size: 40.0,
                  ),
                  onPressed: () {
                    // rating + 1
                    DocumentReference docref = Firestore.instance
                        .collection('hochschulen')
                        .document('fhkiel')
                        .collection('mensa')
                        .document(dish.id);
                    Firestore.instance.runTransaction((transaction) async {
                      DocumentSnapshot freshSnap =
                          await transaction.get(docref);
                      await transaction.update(freshSnap.reference, {
                        'rating': freshSnap['rating'] + 1,
                      });
                    });
                  }),
              Text(
                dish.rating.toString(),
                style: Styles.h2.apply(color: Styles.white),
              ),
              CupertinoButton(
                padding: EdgeInsets.all(0),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Styles.white,
                  size: 40.0,
                ),
                onPressed: () {
                  // rating - 1
                  DocumentReference docref = Firestore.instance
                      .collection('hochschulen')
                      .document('fhkiel')
                      .collection('mensa')
                      .document(dish.id);
                  Firestore.instance.runTransaction((transaction) async {
                    DocumentSnapshot freshSnap = await transaction.get(docref);
                    await transaction.update(freshSnap.reference, {
                      'rating': freshSnap['rating'] - 1,
                    });
                  });
                },
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

//creates a Tag
class Tag extends StatelessWidget {
  final String tag;

  // Constructor
  Tag({Key key, this.tag = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(right: 10.0, bottom: 20.0),
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
              tag,
              style: Styles.tiny.apply(color: Styles.white),
            ),
          )
        ],
      ),
    );
  }
}
