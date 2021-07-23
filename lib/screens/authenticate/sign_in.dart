// ignore: slash_for_doc_comments
/**
 * Display the sign in page and the button to select
 * the sign in method/mode
 */
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
          child: Text('Sign In Annonymously'),
          onPressed: () async {
            dynamic user = await _auth.signInAnon();
            if (user == null) {
              print('Error occurs when signing in');
            } else {
              print('Signed In');
              print(user);
            }
          },
        ),
      ),
    );
  }
}
