import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night/ui/views/details_view.dart';
import 'package:movie_night/ui/views/home_view.dart';
import 'package:movie_night/ui/views/login_view.dart';
import 'package:movie_night/ui/views/watchlist_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        return CupertinoPageRoute(
            builder: (_) => LoginView(), settings: settings);
      case 'home':
        return CupertinoPageRoute(
            builder: (_) => HomeView(), settings: settings);
      case 'watchlist':
        return CupertinoPageRoute(
            builder: (_) => WatchlistView(), settings: settings);
      case 'details':
        return CupertinoPageRoute(
            builder: (_) => DetailsView(), settings: settings);
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          );
        });
    }
  }
}

//Old code
/*
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
              */
