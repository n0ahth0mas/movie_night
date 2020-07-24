import 'package:movie_night/core/models/movie.dart';
import 'package:movie_night/core/models/user.dart';
import 'package:movie_night/locator.dart';

import 'api.dart';

class WatchlistService {
  Api _api = locator<Api>();

  List<Movie> _watchlist = [];
  List<Movie> get watchlist => _watchlist;

  Future getUserWatchlist(User user) async {
    for (String id in user.watchlistId) {
      _watchlist.add(await _api.getMovie(id));
    }
  }

  bool inList(Movie movie) {
    return _watchlist.contains(movie);
  }

  void editList(Movie movie, bool remove) {
    if (remove) {
      _watchlist.remove(movie);
      print("removed " + movie.title + " from list in watchlist service");
    } else {
      _watchlist.add(movie);
      print("added " + movie.title + " to list in watchlist service");
    }
  }
}
