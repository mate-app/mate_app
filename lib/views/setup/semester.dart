// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:mateapp/models/models.dart';
// import 'package:mateapp/views/views.dart';

// class SemesterScreen extends StatelessWidget {
//   final University university;
//   final Subject subject;

//   SemesterScreen({Key key, @required this.university, @required this.subject})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: PlatformText(subject.name),
//       ),
//       child: SemesterList(
//         university: university,
//         subject: subject,
//       ),
//     );
//   }
// }

// class SemesterList extends StatefulWidget {
//   final University university;
//   final Subject subject;

//   SemesterList({Key key, @required this.university, @required this.subject});

//   @override
//   _SemesterListState createState() => _SemesterListState();
// }

// class _SemesterListState extends State<SemesterList> {
//   @override
//   Widget build(BuildContext context) {
//     final duration = widget.subject.duration;

//     return ListView.separated(
//         itemBuilder: (context, index) {
//           return Material(
//             child: Container(
//               color: CupertinoColors.white,
//               child: ListTile(
//                 title: PlatformText("${index + 1}. Fachsemester"),
//                 trailing: Icon(CupertinoIcons.right_chevron),
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       CupertinoPageRoute(
//                           builder: (context) => Login(
//                               university: widget.university,
//                               subject: widget.subject,
//                               semester: index + 1)));
//                 },
//               ),
//             ),
//           );
//         },
//         separatorBuilder: (BuildContext context, int index) => const Divider(),
//         itemCount: duration);
//   }
// }
