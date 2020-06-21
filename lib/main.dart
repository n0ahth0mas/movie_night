import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_night/movieDetails.dart';
import 'package:movie_night/partyDetails.dart';
import 'package:movie_night/splash.dart';
import 'package:movie_night/partyList.dart';
import 'package:movie_night/watchlist.dart';
import 'package:movie_night/home.dart';

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
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/splash':
              return CupertinoPageRoute(
                  builder: (_) => Splash(), settings: settings);
             case '/partyList':
              return CupertinoPageRoute(
                  builder: (_) => PartyList(), settings: settings);
            case '/watchlist':
              return CupertinoPageRoute(
                  builder: (_) => Watchlist(), settings: settings);
            case '/details':
              return CupertinoPageRoute(
                  builder: (_) => Details(), settings: settings);
            case '/partyDetails':
              return CupertinoPageRoute(
                  builder: (_) => PartyDetails(), settings: settings);
            case '/home':
              return CupertinoPageRoute(
                  builder: (_) => Home(), settings: settings); 
            default:
              return CupertinoPageRoute(
                  builder: (_) => Home(), settings: settings);
          }
        },
        );
  }
}
