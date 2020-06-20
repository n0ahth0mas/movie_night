import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night/movie.dart';
import 'package:movie_night/user.dart';

class Details extends StatefulWidget {
  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {
  _showDialog(User user, Movie movie) {
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
                onPressed: () => _deletelist(user, movie),
                child: Text("Remove"),
              )
            ]));
  }

//add some sort of deletion in firebase? or pass whole list through?
  _deletelist(User user, Movie movie) {
    user.deleteFromWatchlist(movie);
    Navigator.popUntil(context, ModalRoute.withName('/watchlist'));
    Navigator.pushReplacementNamed(context, '/watchlist', arguments: {"user":user});
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
                onPressed: () => _showDialog(user, movie))),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Center(child: Image.network(movie.poster, height: 450)),
          Center(
              child: Container(
            padding: EdgeInsets.all(10),
            child:
                Text(movie.title, style: Theme.of(context).textTheme.headline4),
          )),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(movie.rating,
                    style: Theme.of(context).textTheme.headline5),
                Text(movie.platforms,
                    style: Theme.of(context).textTheme.headline5),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 100),
            child: Text(movie.desc),
          ),
        ],
      )),
    );
  }
}
