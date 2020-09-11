import 'package:flutter/material.dart';

import 'local_widgets/local_widgets.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [SettingsList()],
      ),
    );
  }
}
