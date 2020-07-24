import 'package:movie_night/core/enums.dart';
import 'package:movie_night/core/models/movie.dart';
import 'package:movie_night/core/models/user.dart';
import 'package:movie_night/core/services/watchlist_service.dart';
import 'package:movie_night/core/viewmodels/base_model.dart';

import '../../locator.dart';

class WatchlistModel extends BaseModel {
  WatchlistService _watchlistService = locator<WatchlistService>();

  List<Movie> get watchlist => _watchlistService.watchlist;

  Future getWatchlist(User user) async {
    setState(ViewState.Busy);
    await _watchlistService.getUserWatchlist(user);
    setState(ViewState.Idle);
  }
}
