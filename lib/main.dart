import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:brew_crew/screens/authenticate/sign_in.dart';
// import 'screens/home/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    StreamProvider<UserApp?>.value(
      initialData: null,
      value: AuthService().user,
      child: App(),
      catchError: (_, __) => null,
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
    );
  }

/*
  Widget _buildStreamProvider() {
    return MaterialApp(
      StreamProvider<UserApp?>.value(
        initialData: null,
        value: AuthService().user,
        child: Column(
          children: <Widget>[
            Wrapper(),
          ],
        ),
      ),
    );
  }
  */
}
