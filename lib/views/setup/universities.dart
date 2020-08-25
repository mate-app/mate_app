import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mateapp/models/university.dart';
import 'package:mateapp/views/setup/subjects.dart';
import 'package:mateapp/services/database.dart';
import 'package:provider/provider.dart';

class UniversityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<University>>.value(
      value: DatabaseService().universityStream,
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Wähle deine Uni/Hochschule aus'),
        ),
        child: UniversityList(),
      ),
    );
  }
}

class UniversityList extends StatefulWidget {
  @override
  _UniversityListState createState() => _UniversityListState();
}

class _UniversityListState extends State<UniversityList> {
  @override
  Widget build(BuildContext context) {
    final universities = Provider.of<List<University>>(context);

    return ListView.separated(
        itemBuilder: (context, index) {
          return Material(
            child: Container(
              color: CupertinoColors.white,
              child: ListTile(
                title: Text(universities[index].name +
                    ' (' +
                    universities[index].city +
                    ')'),
                trailing: Icon(CupertinoIcons.right_chevron),
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              SubjectScreen(university: universities[index])));
                },
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: universities?.length ?? 0);
  }
}
