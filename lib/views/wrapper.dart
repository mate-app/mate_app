import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
// Custom
import 'package:mateapp/views/setup/welcome.dart';
import 'package:mateapp/views/main/app.dart';
import 'package:mateapp/models/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context); // access userdata from provider

    // If a user is logged in this will return the main app, otherwise the setup.
    return user==null ? WelcomeScreen() : MateAppHomePage();
  }
}