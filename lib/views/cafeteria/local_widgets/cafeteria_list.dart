import 'package:flutter/material.dart';

import '../../../models/models.dart';
import 'local_widgets.dart';

class CafeteriaList extends StatelessWidget {
  final List<Dish> dishes;
  final UserModel user;

  const CafeteriaList({Key key, this.dishes, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return CafeteriaListPanel(user: user, dish: dishes[index]);
      }, childCount: dishes?.length ?? 0),
    );
  }
}
