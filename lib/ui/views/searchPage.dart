import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night/core/models/movie.dart';
import 'package:movie_night/core/models/movieList.dart';
import 'package:movie_night/core/models/user.dart';
import 'package:movie_night/core/services/api.dart';

/*
class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  List<int> watchList;

  int sampleMovieId = 508439;

  User user;

  Api _api = new Api();

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

    Future<List<Result>> search(String search) async {
      return _api.getMovieListFromName(search.toString());
    }

    _leadImg(Movie movie) {
      if (movie.posterPath != null)
        return Image.network(movie.getPoster(154));
      else
        return Image.asset("assets/images/transparent.png");
    }

    Widget _createListItem(user, int movieId) {
      return Container(
          child: FutureBuilder<Movie>(
              future: _api.getMovie(movieId.toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CupertinoButton(
                      onPressed: () => _getInfo(user, snapshot.data),
                      child: ListTile(
                        //fix image
                        leading: _leadImg(snapshot.data),
                        title: Text(snapshot.data.title),
                      ));
                } else
                  return CupertinoActivityIndicator();
              }));
    }

    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Add to Watchlist"),
        leading: Material(
          color: Colors.transparent,
          child: IconButton(
              icon: Icon(CupertinoIcons.back),
              onPressed: () => {
                    Navigator.pop(context),
                    Navigator.pushReplacementNamed(context, '/watchlist',
                        arguments: {"user": user})
                  }),
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: <Widget>[
                Positioned(
                    right: 0,
                    top: 25,
                    child: Material(
                      color: Colors.transparent,
                      child: Icon(CupertinoIcons.ellipsis),
                    )),
                SearchBar<Result>(
                  loader: Center(
                    child: CupertinoActivityIndicator(
                      radius: 40,
                    ),
                  ),
                  emptyWidget: Center(
                    child: Text(
                        "Hmm, it looks like we cant find anything with that title"),
                  ),
                  searchBarStyle: SearchBarStyle(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  searchBarPadding: EdgeInsets.only(right: 40),
                  onSearch: search,
                  onItemFound: (Result result, int index) {
                    return _createListItem(user, result.id);
                  },
                )
              ],
            )),
      ),
    );
  }
}*/
