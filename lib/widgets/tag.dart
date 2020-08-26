import 'package:flutter/material.dart';

// TODO: remove import use inheritance
import 'package:mateapp/styles/styles.dart';

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
