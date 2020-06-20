import 'package:movie_night/movie.dart';
import 'package:movie_night/party.dart';

class User {
  String name;
  List<Movie> watchlist;
  List<Party> parties = [];

  addParty(Party party) {
    this.parties.add(party);
  }

  User(this.name, this.watchlist);
}
