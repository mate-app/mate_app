import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
// Custom
import 'package:mateapp/views/views.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context); // access userdata from provider

    // If a user is logged in this will return the main app, otherwise the setup.
    return user == null ? WelcomeScreen() : MateAppHomePage(user);
  }
}
