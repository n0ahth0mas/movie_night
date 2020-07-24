import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night/core/enums.dart';
import 'package:movie_night/core/models/movie.dart';
import 'package:movie_night/core/models/user.dart';
import 'package:movie_night/core/viewmodels/watchlist_model.dart';
import 'package:movie_night/ui/views/base_view.dart';
import 'package:provider/provider.dart';

class WatchlistView extends StatelessWidget {
  Widget _createMovieCard(Movie movie, BuildContext context) {
    return CupertinoButton(
      onPressed: () => _getInfo(movie, context),
      child: Image.network(movie.getPoster(185)),
    );
  }

  _getInfo(Movie movie, BuildContext context) {
    Navigator.pushNamed(
      context,
      "details",
      arguments: movie,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<WatchlistModel>(
        onModelReady: (model) => model.getWatchlist(Provider.of<User>(context)),
        builder: (context, model, child) => Scaffold(
            body: model.state == ViewState.Idle
                ? CustomScrollView(
                    primary: false,
                    slivers: <Widget>[
                      CupertinoSliverNavigationBar(
                        largeTitle: Text("My Watchlist"),
                        trailing: Material(
                            color: Colors.transparent,
                            child: IconButton(
                                icon: Icon(CupertinoIcons.add_circled_solid),
                                onPressed: () =>
                                    Navigator.pushNamed(context, 'search'))),
                      ),
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.7)),
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return _createMovieCard(
                              model.watchlist[index], context);
                        }, childCount: model.watchlist.length),
                      ),
                    ],
                  )
                : Center(child: CircularProgressIndicator())));
  }
}
