import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night/objects/movie.dart';
import 'package:movie_night/data/servicesMovie.dart';
import 'package:movie_night/objects/user.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class SearchPageState extends State<SearchPage> {
  List<int> watchList;

  int sampleMovieId = 508439;

  User user;

  Widget _createMovieCard(user, int movieId) {
    return Container(
        child: FutureBuilder<Movie>(
            future: getMovie(movieId.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Card(
                    elevation: 5,
                    child: CupertinoButton(
                        onPressed: () => _getInfo(user, snapshot.data),
                        child: Row(
                          children: <Widget>[
                            Image.network(snapshot.data.getPoster(92),
                                height: 90),
                            Padding(padding: EdgeInsets.only(left: 20)),
                            Flexible(
                                child: Text(
                              snapshot.data.title,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ))
                          ],
                        )));
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

  _addToList(User user, int id) {
    user.addToWatchList(id);
    _refreshWatchList(user);
  }

  _refreshWatchList(User user) {
    setState(() {
      watchList = user.watchlistId;
    });
  }

  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
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
        middle: Text("Add to Watchlist"),
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
              SearchBar<Post>(
                searchBarStyle: SearchBarStyle(
                  borderRadius: BorderRadius.circular(10),
                ),
                searchBarPadding: EdgeInsets.only(right: 40),
                onSearch: search,
                onItemFound: (Post post, int index) {
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.description),
                  );
                },
              )],
        )),
      ),
    );
  }
}

/*return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<>,
        ),
      ),
    );
      
        body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              largeTitle: Text("Search"),
            ),
            SliverAppBar(
              title: SearchBar(onSearch: null, onItemFound: null)
            ),
            SliverList(
              delegate:  SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return _createMovieCard(user, watchList[index]);
              }, childCount: watchList.length),
            ),
          ],
        ));
  }
}*/
