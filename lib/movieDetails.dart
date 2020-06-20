import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night/movie.dart';

class Details extends StatefulWidget {
  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {

  _showDialog(BuildContext context) {
    return showDialog(
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
                onPressed: () => _deletelist(context),
                child: Text("Remove"),
              )
            ]));
  }
//add some sort of deletion in firebase? or pass whole list through?
  _deletelist(BuildContext context) {
    return (Navigator.popUntil(context, ModalRoute.withName('/layout')));
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Movie> rcvdData =
        ModalRoute.of(context).settings.arguments;

    final movie = rcvdData["movie"];

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
            onPressed: () => _showDialog(context),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Center(child: Image.network(movie.poster, height: 450)),
          Center(
              child: Container(
            padding: EdgeInsets.all(10),
            child: Text(movie.title, style: Theme.of(context).textTheme.headline4),
          )),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(movie.rating, style: Theme.of(context).textTheme.headline5),
                Text(movie.platforms, style: Theme.of(context).textTheme.headline5),
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
