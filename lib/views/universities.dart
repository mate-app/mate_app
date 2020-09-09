import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../models/models.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class Universities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<University>>(
      future: Collection<University>(path: 'hochschulen').getData(),
      builder:
          (BuildContext context, AsyncSnapshot<List<University>> snapshot) {
        if (snapshot.hasData) {
          // if (snapshot.data.length > 1) {
          //   Navigator.pushReplacement(context,
          //       platformPageRoute(context: context, builder: (_) => Home()));
          // }
          return UniversityList(universities: snapshot.data);
        }
        return LoadingScreen();
      },
    );
  }
}

class UniversityList extends StatelessWidget {
  final List<University> universities;

  const UniversityList({
    Key key,
    this.universities,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        PlatformWidget(
          material: (context, platform) => SliverAppBar(
            pinned: true,
            forceElevated: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: PlatformText('Organisation wählen'),
            ),
          ),
          cupertino: (context, platform) => CupertinoSliverNavigationBar(
            largeTitle: PlatformText('Organisation wählen'),
          ),
        ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return ListTile(
              title: PlatformText(
                  '${universities[index].name} (${universities[index].city})'),
              onTap: () {},
            );
          }, childCount: universities.length),
        ),
      ],
    );
  }
}
