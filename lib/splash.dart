import 'package:flutter/material.dart';
import 'package:movie_night/layout.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.black,
                color: Colors.purple,
                child: Text("Login", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Layout()));
                })));
  }
}
