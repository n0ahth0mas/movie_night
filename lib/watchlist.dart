import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night/movie.dart';
import 'package:movie_night/servicesMovie.dart';
import 'package:movie_night/user.dart';

class Watchlist extends StatefulWidget {
  @override
  WatchlistState createState() => WatchlistState();
}

class WatchlistState extends State<Watchlist> {
  List<int> watchList;

  int sampleMovieId = 508439;

  User user;

  Widget _createWatchList(user, List<int> movieList) {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(movieList.length, (index) {
          final currentMovie = movieList[index].toString();
          return Container(
              //padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: FutureBuilder<Movie>(
                  future: getMovie(currentMovie),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CupertinoButton(
                          onPressed: () => _getInfo(user, snapshot.data),
                          child: Image.network(snapshot.data.getPoster(185)),
                          );
                    } else
                      return CupertinoActivityIndicator();
                  }));
        }));
  }

  _getInfo(User user, Movie movie) {
    Navigator.pushNamed(
      context,
      "/details",
      arguments: {"user": user, "movie": movie},
    );
  }

  _addToList(User user, int id) {
    user.addToWatchList(id);
    _refreshWatchList(user);
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
      appBar: CupertinoNavigationBar(
          middle: Text("My Watchlist"),
          trailing: Material(
            color: Colors.transparent,
            child: IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () => _addToList(user, sampleMovieId)),
          )),
      body: _createWatchList(user, watchList),
    );
  }
}
