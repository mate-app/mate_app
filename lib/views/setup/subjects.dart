// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';
// import 'package:mateapp/models/models.dart';
// import 'package:mateapp/services/services.dart';
// import 'package:mateapp/views/views.dart';

// class SubjectScreen extends StatelessWidget {
//   final University university;

//   SubjectScreen({Key key, @required this.university}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<List<Subject>>.value(
//       value: Collection<Subject>(
//           path: 'hochschulen/${university.shortName}/subjects',
//           order: ['name', 'ASC']).streamData(),
//       child: CupertinoPageScaffold(
//         navigationBar: CupertinoNavigationBar(
//           middle: PlatformText('Wähle dein Modul'),
//         ),
//         child: SubjectList(
//           university: university,
//         ),
//       ),
//     );
//   }
// }

// class SubjectList extends StatefulWidget {
//   final University university;

//   SubjectList({Key key, @required this.university});

//   @override
//   _SubjectListState createState() => _SubjectListState();
// }

// class _SubjectListState extends State<SubjectList> {
//   @override
//   Widget build(BuildContext context) {
//     final subjects = Provider.of<List<Subject>>(context) ?? [];

//     return ListView.separated(
//         itemBuilder: (context, index) {
//           return Material(
//             child: Container(
//               color: CupertinoColors.white,
//               child: ListTile(
//                 title: PlatformText(subjects[index].name),
//                 trailing: Icon(CupertinoIcons.right_chevron),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       CupertinoPageRoute(
//                           builder: (context) => SemesterScreen(
//                               university: widget.university,
//                               subject: subjects[index])));
//                 },
//               ),
//             ),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) => const Divider(),
//         itemCount: subjects?.length ?? 2);
//   }
// }
