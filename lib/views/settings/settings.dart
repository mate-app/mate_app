import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/services.dart';
import '../../shared/shared.dart';
import '../../styles/styles.dart';
import 'local_widgets/local_widgets.dart';

class Settings extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          SettingsListGeneral(),
          SettingsListInformation(),
          if (!AuthService().getUser.isAnonymous)
            Container(
              color: MateColors.white,
              height: 80.0,
              child: Center(
                child: PlatformButton(
                  color: MateColors.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  onPressed: () async {
                    final credentials = await SharedPreferences.getInstance();
                    credentials.remove('email');
                    credentials.remove('password');
                    await _auth.signOut();
                  },
                  child: PlatformText('logout'),
                ),
              ),
            )
          else
            RegisterButton(),
        ],
      ),
    );
  }
}
