// ignore: slash_for_doc_comments
/***
 * Called by wrapper when the user is NULL
 * @associate: sign_in.dart to display the option for sign in
 */

import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'package:brew_crew/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toogleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toogleView: toogleView);
    } else {
      return Register(toogleView: toogleView);
    }
  }
}
