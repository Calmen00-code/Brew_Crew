import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:brew_crew/screens/authenticate/sign_in.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: <Widget>[
              SpinKitRotatingCircle(
                color: Colors.white,
                size: 50.0,
              ),
              SizedBox(height: 10.0),
              Text(
                'Loading',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
