import 'package:flutter/material.dart';
import 'package:movie_night/movie.dart';
class Watchlist extends StatefulWidget {
  @override
  WatchlistState createState() => WatchlistState();
}

class WatchlistState extends State<Watchlist> {

  /*
  Try to inherit this from user
  
  List<Movie> movieList = [
    Movie(
      "Terminator",
      "https://images-na.ssl-images-amazon.com/images/I/71hL9hv3RPL._AC_SY679_.jpg",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum non metus ut consectetur. Curabitur posuere turpis eget interdum pharetra. Donec tristique mauris felis, in sodales nunc ornare quis. Nunc ac odio nisl. Aliquam erat volutpat. Duis fermentum imperdiet feugiat. Maecenas vehicula leo ac scelerisque vehicula. Cras consequat justo et scelerisque egestas. Duis ornare tortor vitae velit lacinia pulvinar. Duis non velit leo. Nam at quam vel dui pellentesque imperdiet. Pellentesque luctus elit non malesuada dictum. Suspendisse hendrerit efficitur felis ut vestibulum. Pellentesque orci leo, lobortis sed dui sit amet, porta efficitur risus. Vestibulum euismod lacus pretium ipsum condimentum, id maximus sapien sollicitudin. Integer commodo, diam sit amet efficitur finibus, nulla diam ultrices risus, quis vestibulum nisl purus non diam. Aliquam tellus lacus, gravida vitae purus vitae, ultrices lobortis metus. Suspendisse rutrum ligula a enim posuere, nec posuere quam suscipit. Fusce arcu tellus, molestie vel felis a, consectetur tempus magna. Fusce ac rhoncus ante, sed convallis mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed congue molestie laoreet.",
      "reviewwww", 
      "platform"
    ),
    Movie(
      "Avengers",
      "https://images-na.ssl-images-amazon.com/images/I/71niXI3lxlL._AC_SY741_.jpg",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum non metus ut consectetur. Curabitur posuere turpis eget interdum pharetra. Donec tristique mauris felis, in sodales nunc ornare quis. Nunc ac odio nisl. Aliquam erat volutpat. Duis fermentum imperdiet feugiat. Maecenas vehicula leo ac scelerisque vehicula. Cras consequat justo et scelerisque egestas. Duis ornare tortor vitae velit lacinia pulvinar. Duis non velit leo. Nam at quam vel dui pellentesque imperdiet. Pellentesque luctus elit non malesuada dictum. Suspendisse hendrerit efficitur felis ut vestibulum. Pellentesque orci leo, lobortis sed dui sit amet, porta efficitur risus. Vestibulum euismod lacus pretium ipsum condimentum, id maximus sapien sollicitudin. Integer commodo, diam sit amet efficitur finibus, nulla diam ultrices risus, quis vestibulum nisl purus non diam. Aliquam tellus lacus, gravida vitae purus vitae, ultrices lobortis metus. Suspendisse rutrum ligula a enim posuere, nec posuere quam suscipit. Fusce arcu tellus, molestie vel felis a, consectetur tempus magna. Fusce ac rhoncus ante, sed convallis mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed congue molestie laoreet.",
      "review",
      "platform",
  )];
*/
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
    return _createWatchList(null);
  }
}
