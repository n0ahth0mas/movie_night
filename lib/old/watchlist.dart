/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night/core/models/movie.dart';
import 'package:movie_night/core/models/user.dart';
import 'package:movie_night/core/services/api.dart';

class Watchlist extends StatefulWidget {
  @override
  WatchlistState createState() => WatchlistState();
}

class WatchlistState extends State<Watchlist> {
  List<int> watchList;

  User user;

  Api _api = new Api();

  Widget _createMovieCard(user, int movieId) {
    return Container(
        child: FutureBuilder<Movie>(
            future: _api.getMovie(movieId.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CupertinoButton(
                  onPressed: () => _getInfo(user, snapshot.data),
                  child: Image.network(snapshot.data.getPoster(185)),
                );
              } else
                return CupertinoActivityIndicator();
            }));
  }

  _getInfo(User user, Movie movie) {
    Navigator.pushNamed(
      context,
      "/details",
      arguments: {"user": user, "movie": movie},
    );
  }

  _searchPage(User user) {
    Navigator.pushNamed(
      context,
      "/search",
      arguments: {
        "user": user,
      },
    );
  }

  _refreshWatchList(User user) {
    setState(() {
      watchList = user.watchlistId;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvdData =
        ModalRoute.of(context).settings.arguments;

    User user = rcvdData["user"];
    watchList = user.watchlistId;

    _refreshWatchList(user);

    return Scaffold(
        body: CustomScrollView(
      primary: false,
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text("My Watchlist"),
          trailing: Material(
              color: Colors.transparent,
              child: IconButton(
                  icon: Icon(CupertinoIcons.add_circled_solid),
                  onPressed: () => _searchPage(user))),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.7)),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return _createMovieCard(user, watchList[index]);
          }, childCount: watchList.length),
        ),
      ],
    ));
  }
}*/
