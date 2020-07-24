import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getflutter/getflutter.dart';
import 'package:movie_night/core/models/movie.dart';
import 'package:movie_night/core/models/user.dart';
import 'package:movie_night/ui/widgets/remove_btn.dart';
import 'package:provider/provider.dart';

class DetailsView extends StatelessWidget {
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
    } else
      return Image.asset("assets/images/transparent.png");
  }

  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text(movie.title),
            trailing:
                Material(color: Colors.transparent, child: RemoveButton(movie)),
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
