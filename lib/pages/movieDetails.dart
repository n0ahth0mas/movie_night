import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getflutter/getflutter.dart';
import 'package:movie_night/objects/movie.dart';
import 'package:movie_night/objects/user.dart';
import 'package:movie_night/pages/watchlist.dart';

class Details extends StatefulWidget {
  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {
  _showDialog(User user, int id, bool inWatchlist) {
    if (inWatchlist) {
      showDialog(
          context: context,
          child: CupertinoAlertDialog(
              title: Text("Remove from your watchlist?"),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                  child: Text("Cancel"),
                ),
                CupertinoDialogAction(
                  textStyle: TextStyle(color: Colors.red),
                  onPressed: () => _deletelist(user, id),
                  child: Text("Remove"),
                )
              ]));
    } else {
      showDialog(
          context: context,
          child: CupertinoAlertDialog(
              title: Text("Add to your watchlist?"),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                  child: Text("Cancel"),
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () => _addList(user, id),
                  child: Text("Add"),
                )
              ]));
    }
  }

//add some sort of deletion in firebase? or pass whole list through?
  _deletelist(User user, int id) {
    user.deleteFromWatchlist(id);
    Navigator.popUntil(context, ModalRoute.withName('/watchlist'));
  }

  _addList(User user, int id) {
    user.addToWatchList(id);
    Navigator.popUntil(context, ModalRoute.withName('/search'));
  }

  _makeStars(double voteAverage) {
    double trueRating = voteAverage / 2;
    print(trueRating);
    return GFRating(
      color: Colors.yellowAccent[700],
      value: trueRating,
      size: GFSize.SMALL,
      allowHalfRating: true,
    );
  }

  Widget _rightBtn(User user, Movie movie) {
    if (user.inWatchlist(movie)) {
      return IconButton(
          icon: Icon(Icons.remove_circle),
          color: Colors.blue,
          onPressed: () => _showDialog(user, movie.id, true));
    } else {
      return IconButton(
          icon: Icon(Icons.add_circle),
          color: Colors.blue,
          onPressed: () => _showDialog(user, movie.id, false));
    }
  }

  _backdrop(String link) {
    if (link != null) {
      return Image.network("http://image.tmdb.org/t/p/w780/$link");
    } else
      return Image.asset("assets/images/transparent.png");
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvdData =
        ModalRoute.of(context).settings.arguments;

    Movie movie = rcvdData["movie"];
    User user = rcvdData["user"];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text(movie.title),
            trailing: Material(
                color: Colors.transparent, child: _rightBtn(user, movie)),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20)),
              Center(child: Image.network(movie.getPoster(342))),
              Center(
                  child: Container(
                padding: EdgeInsets.all(10),
                child: Center(
                    child: Text(movie.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w800))),
              )),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _makeStars(movie.voteAverage),
                    Text("platform",
                        style: Theme.of(context).textTheme.headline5),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 10, 50),
                child: Text(movie.overview),
              ),
              _backdrop(movie.backdropPath)
            ],
          ))
        ],
      ),
    );
  }
}
