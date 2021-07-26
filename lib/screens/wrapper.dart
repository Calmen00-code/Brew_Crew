// ignore: slash_for_doc_comments
/**
 * Act as a listener to determine which states of the app is in
 * Wheter it is in Authentication State or User Signed In State
 */

import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using provider of method to get the state of user sign in or sign out
    final user = Provider.of<UserApp?>(context);

    // @return home when user logged in
    // @return authenticate when user logged out or no user detected
    if (user == null) {
      return Authenticate();
    } else {
      // Passing user to Home to retrieve the uid
      // when calling DatabaseService() in StreamProvider of home.dart
      return Home(user);
    }
  }
}
