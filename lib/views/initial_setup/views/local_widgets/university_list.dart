import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../models/models.dart';
import '../../../../services/services.dart';
import '../../../../shared/shared.dart';
import '../../../../styles/styles.dart';
import '../../../views.dart';

class UniversityList extends StatefulWidget {
  final List<University> universities;

  const UniversityList({
    Key key,
    this.universities,
  }) : super(key: key);

  @override
  _UniversityListState createState() => _UniversityListState();
}

class _UniversityListState extends State<UniversityList> {
  final AuthService _auth = AuthService();
  bool _loading = false;

  Future<void> sendForm(University university) async {
    setState(() {
      _loading = true;
    });
    await _auth.anonLogin(university).then((value) {
      Navigator.push(
          context, platformPageRoute(context: context, builder: (_) => Home()));
    }, onError: (error) {
      setState(() {
        _loading = false;
      });
      _alert(
          error is String ? error : 'Ein unbekannter Fehler ist aufgetreten.');
    });
  }

  Future<void> _alert(String message) async {
    return showPlatformDialog(
        context: context,
        builder: (_) => PlatformAlertDialog(
              title: const Text('Fehler'),
              content: Text(message),
              actions: <Widget>[
                PlatformDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('nochmal versuchen'),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const LoadingScreen()
        : PlatformScaffold(
            appBar: PlatformAppBar(
              title: Text(
                'Studiengang wählen',
                style: TextStyle(
                  fontSize: Platform.isAndroid ? 20 : 15.5,
                  color: MateColors.black,
                ),
              ),
              material: (_, __) => MaterialAppBarData(
                backgroundColor: MateColors.white,
                iconTheme: const IconThemeData(
                  color: MateColors.primary,
                ),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                color: MateColors.white,
              ),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      final int itemIndex = index ~/ 2;
                      if (index.isEven) {
                        return PlatformListItem(
                          itemIndex: itemIndex,
                          action: () async {
                            await sendForm(widget.universities[itemIndex]);
                          },
                          text:
                              '${widget.universities[itemIndex].name} (${widget.universities[itemIndex].city})',
                        );
                      }
                      return const Divider(
                        height: 0,
                        color: MateColors.lightGrey,
                      );
                    }, semanticIndexCallback: (Widget widget, int localIndex) {
                      if (localIndex.isEven) {
                        return localIndex ~/ 2;
                      }
                      return null;
                    },
                        childCount:
                            math.max(0, widget.universities.length * 2 - 1)),
                  ),
                ],
              ),
            ),
          );
  }
}
