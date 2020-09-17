import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../models/models.dart';
import '../../../services/services.dart';
import '../../../shared/widgets.dart';
import '../../../styles/styles.dart';

class CafeteriaListPanel extends StatefulWidget {
  final Dish dish;
  final UserModel user;

  const CafeteriaListPanel({Key key, this.dish, this.user}) : super(key: key);

  @override
  _CafeteriaListPanelState createState() => _CafeteriaListPanelState();
}

class _CafeteriaListPanelState extends State<CafeteriaListPanel> {
  bool upvoted;
  bool downvoted;
  bool _btnEnabled = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _btnEnabled = false;
      downvoted = widget.user.downvotes.contains(widget.dish.id) ?? false;
      upvoted = widget.user.upvotes.contains(widget.dish.id) ?? false;
    });
  }

  Future<void> _vote(Map increment, Map userVotes) async {
    await Document(
            path:
                'hochschulen/${widget.user.university}/mensa/${widget.dish.id}')
        .upsert(increment);
    return UserData(collection: 'users').upsert(userVotes);
  }

  Future<void> _upvote() async {
    setState(() {
      _btnEnabled = false;
    });
    if (downvoted) return;
    final Map increment = {'rating': FieldValue.increment(upvoted ? -1 : 1)};
    final Map userVotes = {
      'votes': upvoted
          ? FieldValue.arrayRemove([widget.dish.id])
          : FieldValue.arrayUnion([widget.dish.id]),
      'upvotes': upvoted
          ? FieldValue.arrayRemove([widget.dish.id])
          : FieldValue.arrayUnion([widget.dish.id]),
    };
    await _vote(increment, userVotes);
    setState(() {
      upvoted = !upvoted ?? true;
      _btnEnabled = true;
    });
  }

  Future<void> _downvote() async {
    setState(() {
      _btnEnabled = false;
    });
    if (upvoted) return;
    final Map increment = {'rating': FieldValue.increment(downvoted ? 1 : -1)};
    final Map userVotes = {
      'votes': downvoted
          ? FieldValue.arrayRemove([widget.dish.id])
          : FieldValue.arrayUnion([widget.dish.id]),
      'upvotes': downvoted
          ? FieldValue.arrayRemove([widget.dish.id])
          : FieldValue.arrayUnion([widget.dish.id]),
    };
    await _vote(increment, userVotes);
    setState(() {
      downvoted = !downvoted ?? true;
      _btnEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tags = widget.dish.tags.length > 3
        ? widget.dish.tags.sublist(0, 3)
        : widget.dish.tags;
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          MateShadows.boxShadow,
        ],
        borderRadius: MateShapes.roundedEdges,
        gradient: MateGradients.primary,
      ),
      height: 210,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
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
                child: DynamicText(widget.dish.name,
                    style: MateTextstyles.h2.apply(color: MateColors.white)),
              ),
              const Spacer(
                flex: 2,
              ),
              Container(
                height: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        for (var i in tags)
                          Tag(
                            tag: i,
                            marginBottom: 20,
                            marginRight: 10,
                          )
                      ],
                    ),
                    PlatformText(
                      '${widget.dish.price} €',
                      style:
                          MateTextstyles.small.apply(color: MateColors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            children: <Widget>[
              const Spacer(),
              PlatformButton(
                padding: const EdgeInsets.all(0),
                onPressed: _btnEnabled && !downvoted ? _upvote : null,
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: upvoted ? Colors.white54 : MateColors.white,
                  size: 40.0,
                ),
              ),
              DynamicText(
                widget.dish.rating.toString(),
                style: MateTextstyles.h2.apply(color: MateColors.white),
              ),
              PlatformButton(
                padding: const EdgeInsets.all(0),
                onPressed: _btnEnabled && !upvoted ? _downvote : null,
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: downvoted ? Colors.white54 : MateColors.white,
                  size: 40.0,
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
