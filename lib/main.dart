// import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/screens/wrapper.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:brew_crew/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home/loading.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return StreamProvider<UserApp?>.value(
              initialData: null,
              value: AuthService().user,
              child: MaterialApp(
                home: Wrapper(),
              ),
            );
          }

          return Loading();
        });
  }
}
