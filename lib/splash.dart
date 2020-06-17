import 'package:flutter/material.dart';
import 'package:movie_night/landing.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Movie Night Splash")),
        body: Center(
            child: RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.black,
                color: Colors.purple[100],
                child: Text("Login", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Landing()));
                })));
  }
}
