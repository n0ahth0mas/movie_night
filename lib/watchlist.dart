import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night/movie.dart';
class Watchlist extends StatefulWidget {
  @override
  WatchlistState createState() => WatchlistState();
}

class WatchlistState extends State<Watchlist> {

  Movie selectedMovie;

  Widget _createWatchList(List<Movie> movieList) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(movieList.length, (index) {
        return Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: InkWell(
                onTap: () => _getInfo(context, movieList[index]),
                child: Image.network(movieList[index].poster, width: 160)));
      }),
    );
  }

  _getInfo(BuildContext context, Movie movie) {
    selectedMovie = movie;
    Navigator.pushNamed(
      context,
      "/details",
      arguments: {"movie": movie},
    );
  }

  /*
  Widget _createWatchlist(List<List<String>> movies) {
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: (movies.length),
      itemBuilder: (BuildContext context, int index) {
        return _watchlistRow(movies[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _movie(List<String> movie){
    return Material(
    child: Container(
      child: Card(
        child: InkWell(
            onTap: () =>
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  Details())),
            child: Image.network(movie[0], width: 160)))));
  }

  Widget _watchlistRow(List<String> movie) {
    return Card(
      child: InkWell(
        onTap: () =>
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  Details())),
        child: Row(
          children: <Widget>[
            Image.network(movie[0], width: 40),
            Text(movie[1],
                 style: Theme.of(context).textTheme.headline6),
        ])));
  }
  */
  @override
  Widget build(BuildContext context) {
    final Map<String, List<Movie>> rcvdData =
        ModalRoute.of(context).settings.arguments;

    List<Movie> watchList = rcvdData["watchList"];

    
    return Scaffold(
      appBar: CupertinoNavigationBar(
          middle: Text("My Watchlist"),
          trailing: Material(
            color: Colors.transparent,
            child:  IconButton(
              icon: Icon(Icons.add_circle), onPressed: (){}),
        )),
      body: _createWatchList(watchList),
    );
    }
}
