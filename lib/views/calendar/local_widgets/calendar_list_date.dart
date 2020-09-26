import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../models/models.dart';
import '../../../styles/styles.dart';

class CalendarListDate extends StatelessWidget {
  final Date date;

  const CalendarListDate({Key key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('de_DE');
    bool isToday;
    if (date.dateTime.day == DateTime.now().day &&
        date.dateTime.month == DateTime.now().month &&
        date.dateTime.year == DateTime.now().year) {
      isToday = true;
    } else {
      isToday = false;
    }
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          MateShadows.boxShadow,
        ],
        borderRadius: MateShapes.roundedEdges,
        gradient: isToday ? MateGradients.primary : MateGradients.primary,
      ),
      height: 30,
      width: MediaQuery.of(context).size.width * 0.95,
      margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
      padding: EdgeInsets.fromLTRB(
        15,
        isToday != null ? 4 : 5,
        15,
        5,
      ),
      child: PlatformText(
        isToday ? 'Heute' : date.asString,
        style: MateTextstyles.font.apply(
            color: MateColors.white,
            fontWeightDelta: isToday != null ? 4 : 1,
            fontSizeDelta: isToday != null ? 2 : 1),
      ),
    );
  }
}
