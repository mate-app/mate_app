import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:mateapp/models/models.dart';
import 'package:mateapp/styles/styles.dart';
import 'package:provider/provider.dart';

class OrganisationPanel extends StatelessWidget {
  final UserModel user;
  final University university;

  const OrganisationPanel({Key key, this.user, this.university})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UserModel user = Provider.of<UserModel>(context);
    final int daysUntilHolidays =
        university.nextHolidays.difference(DateTime.now()).inDays;
    final int percentOfStudyDone = ((user.credits / 210) * 100).round();

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          MateShadows.boxShadow,
        ],
        borderRadius: MateShapes.roundedEdges,
        gradient: MateGradients.primary,
      ),
      height: 220,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(children: <Widget>[
            //Tage bis zu den Ferien
            Container(
              margin: const EdgeInsets.fromLTRB(10, 25, 10, 10),
              height: MediaQuery.of(context).size.width * 0.18,
              width: MediaQuery.of(context).size.width * 0.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.18,
                ),
                border: Border.all(
                  color: MateColors.white,
                  width: 3.0,
                ),
              ),
              child: Center(
                  child: PlatformText(daysUntilHolidays.toString(),
                      style: MateTextstyles.font
                          .apply(color: MateColors.grey, fontWeightDelta: 2))),
            ),
            Container(
                constraints: BoxConstraints(
                  minWidth: 50,
                  maxWidth: MediaQuery.of(context).size.width * 0.20,
                ),
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                alignment: const Alignment(0.0, 1.0),
                child: PlatformText(
                  "Tage bis zu den Ferien",
                  style: MateTextstyles.font.apply(color: MateColors.white),
                  textAlign: TextAlign.center,
                )),
          ]),

          // Fortschritt
          Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.width * 0.25,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.25,
                ),
                border: Border.all(
                  color: MateColors.white,
                  width: 3.0,
                ),
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [
                    0.0,
                    percentOfStudyDone / 100,
                    percentOfStudyDone / 100 + 0.001,
                  ],
                  colors: const [
                    // Colors are easy thanks to Flutter's Colors class.
                    MateColors.white,
                    MateColors.white,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Center(
                child: PlatformText(percentOfStudyDone.toString(),
                    style: MateTextstyles.h2.apply(color: MateColors.grey)),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              constraints: BoxConstraints(
                minWidth: 86,
                maxWidth: MediaQuery.of(context).size.width * 0.28,
              ),
              child: PlatformText(
                'Fortschritt $percentOfStudyDone%',
                style: MateTextstyles.h2.apply(color: MateColors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ]),

          //Notenschnitt
          Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(10, 25, 10, 10),
              height: MediaQuery.of(context).size.width * 0.18,
              width: MediaQuery.of(context).size.width * 0.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width * 0.18,
                ),
                border: Border.all(
                  color: MateColors.white,
                  width: 3.0,
                ),
              ),
              child: Center(
                  child: PlatformText(user.average.toString(),
                      style: MateTextstyles.font
                          .apply(color: MateColors.grey, fontWeightDelta: 2))),
            ),
            Container(
                constraints: BoxConstraints(
                  minWidth: 50,
                  maxWidth: MediaQuery.of(context).size.width * 0.20,
                ),
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                alignment: const Alignment(0.0, 1.0),
                child: PlatformText(
                  "Dein Schnitt",
                  style: MateTextstyles.font.apply(color: MateColors.white),
                  textAlign: TextAlign.center,
                )),
          ]),
        ],
      ),
    );
  }
}
