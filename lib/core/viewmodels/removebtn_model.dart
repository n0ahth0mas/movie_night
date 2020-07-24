import 'package:movie_night/core/models/movie.dart';
import 'package:movie_night/core/services/watchlist_service.dart';
import 'package:movie_night/core/viewmodels/base_model.dart';

import '../../locator.dart';

class RemoveButtonModel extends BaseModel {
  WatchlistService _watchlistService = locator<WatchlistService>();

  //bool watchlistStatus()

  void removeMovie(Movie movie) {
    print("removed " + movie.title + " from list in remove button model");
    _watchlistService.editList(movie, true);
    notifyListeners();
  }

  void addMovie(Movie movie) {
    print("added " + movie.title + " to list in remove button model");
    _watchlistService.editList(movie, false);
    notifyListeners();
  }
}
