import 'package:flutter/material.dart';
import 'package:movie_night/party.dart';
import 'package:movie_night/user.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  List<int> movieList = [
    496243, 122917
  ];

  @override
  Widget build(BuildContext context) {
    var user = new User("Noah", movieList);

    var party = Party.withUser("My First Party", user, "abc");
    var party2 = Party.withUser("My Second Party", user, "abc");
    var party3 = Party.withUser("My Third Party", user, "abc");
    var party4 = Party.withUser("My Fourth Party", user, "abc");

    var partyList = [party, party2, party3, party4];

    return Scaffold(
        body: Center(
          child: RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.black,
            color: Colors.purple,
            child: Text("Login", style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home',
                    arguments: {"user": user, "partyList": partyList});
              } 
    )));
  }
}
