import 'package:movie_night/objects/movie.dart';
import 'package:movie_night/objects/party.dart';

class User {
  String name;
  List<int> watchlistId = [];
  List<Party> parties = [];

  addParty(Party party) {
    this.parties.add(party);
  }

  deleteFromWatchlist(int id) {
    watchlistId.remove(id);
  }

  addToWatchList(int id) {
    watchlistId.add(id);
  }

  bool inWatchlist(Movie movie) {
    return (watchlistId.contains(movie.id));
  }

  User(this.name, this.watchlistId);
}
