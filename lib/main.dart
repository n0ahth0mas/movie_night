import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_night/movieDetails.dart';
import 'package:movie_night/partyDetails.dart';
import 'package:movie_night/splash.dart';
import 'package:movie_night/partyList.dart';
import 'package:movie_night/watchlist.dart';
import 'package:movie_night/layout.dart';
import 'package:movie_night/home.dart';
import 'package:movie_night/subLayout.dart';
import 'package:getflutter/getflutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movie App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.grey,
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            )),
        initialRoute: "/splash",
        routes: <String, WidgetBuilder>{
          '/splash' : (BuildContext context) => new Splash(),
          '/partyList' : (BuildContext context) => new PartyList(),
          '/watchlist' : (BuildContext context) => new Watchlist(),
          '/details' : (BuildContext context) => new Details(),
          '/partyDetails' : (BuildContext context) => new PartyDetails(),
          '/layout' : (BuildContext context) => new Layout(),
          '/partyWatchList' : (BuildContext context) => new SubLayout(),
          '/home' : (BuildContext context) => new Home()
,        });
  }
}
