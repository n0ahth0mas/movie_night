import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  @override
  LandingState createState() => LandingState();
}

class LandingState extends State<Landing> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Movie Night Landing")),
        body: new Center(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Text("Logged in")
                ],
              )
            ])));
  }
}