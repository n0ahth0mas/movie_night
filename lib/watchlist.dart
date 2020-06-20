import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night/movie.dart';
import 'package:movie_night/user.dart';

class Watchlist extends StatefulWidget {
  @override
  WatchlistState createState() => WatchlistState();
}

class WatchlistState extends State<Watchlist> {
  List<Movie> watchList;

  Movie sampleMovie = Movie(
    "Avengers",
    "https://images-na.ssl-images-amazon.com/images/I/71niXI3lxlL._AC_SY741_.jpg",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum non metus ut consectetur. Curabitur posuere turpis eget interdum pharetra. Donec tristique mauris felis, in sodales nunc ornare quis. Nunc ac odio nisl. Aliquam erat volutpat. Duis fermentum imperdiet feugiat. Maecenas vehicula leo ac scelerisque vehicula. Cras consequat justo et scelerisque egestas. Duis ornare tortor vitae velit lacinia pulvinar. Duis non velit leo. Nam at quam vel dui pellentesque imperdiet. Pellentesque luctus elit non malesuada dictum. Suspendisse hendrerit efficitur felis ut vestibulum. Pellentesque orci leo, lobortis sed dui sit amet, porta efficitur risus. Vestibulum euismod lacus pretium ipsum condimentum, id maximus sapien sollicitudin. Integer commodo, diam sit amet efficitur finibus, nulla diam ultrices risus, quis vestibulum nisl purus non diam. Aliquam tellus lacus, gravida vitae purus vitae, ultrices lobortis metus. Suspendisse rutrum ligula a enim posuere, nec posuere quam suscipit. Fusce arcu tellus, molestie vel felis a, consectetur tempus magna. Fusce ac rhoncus ante, sed convallis mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed congue molestie laoreet.",
    "review",
    "platform",
  );

  User user;

  Widget _createWatchList(user, List<Movie> movieList) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(movieList.length, (index) {
        return Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: InkWell(
                onTap: () => _getInfo(user, movieList[index]),
                child: Image.network(movieList[index].poster, width: 160)));
      }),
    );
  }

  _getInfo(User user, Movie movie) {
    Navigator.pushNamed(
      context,
      "/details",
      arguments: {"user": user, "movie": movie},
    );
  }

  _addToList(User user, Movie movie) {
    user.addToWatchList(movie);
    _refreshWatchList(user);
  }

  _refreshWatchList(User user) {
    setState(() {
      watchList = user.watchlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvdData =
        ModalRoute.of(context).settings.arguments;

    User user = rcvdData["user"];
    watchList = user.watchlist;

    _refreshWatchList(user);

    return Scaffold(
      appBar: CupertinoNavigationBar(
          middle: Text("My Watchlist"),
          trailing: Material(
            color: Colors.transparent,
            child: IconButton(
                icon: Icon(Icons.add_circle),
                onPressed: () => _addToList(user, sampleMovie)),
          )),
      body: _createWatchList(user, watchList),
    );
  }
}
