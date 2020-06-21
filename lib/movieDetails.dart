import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getflutter/getflutter.dart';
import 'package:movie_night/movie.dart';
import 'package:movie_night/user.dart';

class Details extends StatefulWidget {
  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {
  _showDialog(User user, int id) {
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
                isDefaultAction: true,
                onPressed: () => _deletelist(user, id),
                child: Text("Remove"),
              )
            ]));
  }

//add some sort of deletion in firebase? or pass whole list through?
  _deletelist(User user, int id) {
    user.deleteFromWatchlist(id);
    Navigator.popUntil(context, ModalRoute.withName('/watchlist'));
    Navigator.pushReplacementNamed(context, '/watchlist',
        arguments: {"user": user});
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

  _backdrop(String link) {
    if (link != null) {
      return Image.network("http://image.tmdb.org/t/p/w780/$link");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvdData =
        ModalRoute.of(context).settings.arguments;

    Movie movie = rcvdData["movie"];
    User user = rcvdData["user"];

    return Scaffold(
      appBar: CupertinoNavigationBar(
          middle: Text(movie.title),
          trailing: Material(
            color: Colors.transparent,
            child: IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: () => _showDialog(user, movie.id)),
          )),
      body: SingleChildScrollView(
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
                    style: Theme.of(context).textTheme.headline4)),
          )),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _makeStars(movie.voteAverage),
                Text("platform", style: Theme.of(context).textTheme.headline5),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 10, 50),
            child: Text(movie.overview),),
          _backdrop(movie.backdropPath)
        ],
      )),
    );
  }
}
