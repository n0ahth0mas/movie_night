import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_night/pages/movieDetails.dart';
import 'package:movie_night/pages/partyDetails.dart';
import 'package:movie_night/pages/searchPage.dart';
import 'package:movie_night/pages/splash.dart';
import 'package:movie_night/pages/partyList.dart';
import 'package:movie_night/pages/watchlist.dart';
import 'package:movie_night/pages/home.dart';

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
            case '/search':
              return CupertinoPageRoute(
                  builder: (_) => SearchPage(), settings: settings);
            default:
              return CupertinoPageRoute(
                  builder: (_) => Splash(), settings: settings);
          }
        });
  }
}
