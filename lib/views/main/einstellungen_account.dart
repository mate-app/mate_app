import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mateapp/widgets/widgets.dart';
import 'package:mateapp/models/models.dart';
import 'package:pie_chart/pie_chart.dart';

// TODO: remove import use inheritance
import '../../styles/styles.dart';

class EinstellungAccount extends StatefulWidget {
  @override
  _EinstellungAccountState createState() {
    return _EinstellungAccountState();
  }
}

class _EinstellungAccountState extends State<EinstellungAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.white,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: StaticNavigationBar('Account'),
            pinned: true,
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            AccountData(),
            AnalyticsSettings(),
          ])),
        ],
      ),
    );
  }
}

class AccountData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
            child: Text(
              'Account Informationen',
              style: Styles.small,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              children: <Widget>[
                //Mail
                AccountListItem(
                  userData: user.mail,
                  title: 'E-Mail:',
                ),
                //Universität
                AccountListItem(
                  userData: user.university,
                  title: 'Universität:',
                ),
                //Fachbereich
                AccountListItem(
                  userData: user.department,
                  title: 'Fachbereich:',
                ),
                //Studiengang
                AccountListItem(
                  userData: user.subject,
                  title: 'Studiengang:',
                ),
                //Votes
                AccountListItem(
                  userData: user.subject,
                  title: 'Deine Mensa-Votes:',
                ),
                //PieChart
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AccountPieChart(
                        user: user,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Ledgend(
                              color: Styles.primary,
                              title: 'Upvotes',
                            ),
                            Ledgend(
                              color: Styles.secondary,
                              title: 'Downvotes',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      width: 1.0,
                      color: Styles.grey,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Ledgend extends StatelessWidget {
  final String title;
  final Color color;

  const Ledgend({
    Key key,
    this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 15,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: color,
            ),
          ),
          Text(
            title,
            style: Styles.small.apply(color: Styles.grey),
          ),
        ],
      ),
    );
  }
}

class AccountListItem extends StatelessWidget {
  const AccountListItem({
    Key key,
    @required this.userData,
    @required this.title,
  }) : super(key: key);

  final userData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Row(
        children: <Widget>[
          Text(title,
              style: Styles.font.apply(color: Styles.grey, fontWeightDelta: 2)),
          Spacer(
            flex: 2,
          ),
          Text(userData, style: Styles.font.apply(color: Styles.grey))
        ],
      ),
    );
  }
}

class AccountPieChart extends StatefulWidget {
  final UserModel user;

  const AccountPieChart({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  _AccountPieChart createState() => _AccountPieChart(user: user);
}

class _AccountPieChart extends State<AccountPieChart> {
  _AccountPieChart({
    Key key,
    @required this.user,
  });

  final UserModel user;
  List<Color> colorList = [
    Styles.primary,
    Styles.secondary,
  ];
  Map<String, double> dataMap = Map();

  @override
  void initState() {
    super.initState();
    dataMap.putIfAbsent("Upvotes", () => 5);
    dataMap.putIfAbsent("Downvotes", () => 3);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: PieChart(
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: 32.0,
          chartRadius: MediaQuery.of(context).size.width / 2.7,
          showChartValuesInPercentage: true,
          showChartValues: true,
          showChartValuesOutside: false,
          chartValueBackgroundColor: Color(0x00ffffff),
          colorList: colorList,
          showLegends: false,
          decimalPlaces: 1,
          showChartValueLabel: true,
          initialAngle: 0,
          chartValueStyle: defaultChartValueStyle.copyWith(
            color: Styles.white,
          ),
          chartType: ChartType.disc,
        ),
      ),
    );
  }
}

class AnalyticsSettings extends StatefulWidget {
  @override
  _AnalyticsSettingsState createState() => _AnalyticsSettingsState();
}

class _AnalyticsSettingsState extends State<AnalyticsSettings> {
  bool analytic;
  // Constructor
  @override
  void initState() {
    analytic = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 50, 0, 10),
          child: Text(
            'Datenschutz Einstellungen',
            style: Styles.small,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            children: [
              Text(
                'Analyse Aktivieren',
                style:
                    Styles.font.apply(color: Styles.grey, fontWeightDelta: 2),
              ),
              Spacer(
                flex: 2,
              ),
              CupertinoSwitch(
                value: analytic ? true : false,
                onChanged: (bool value) {
                  setState(() {
                    analytic = analytic ? false : true;
                  });
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
