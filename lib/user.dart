import 'package:movie_night/movie.dart';
import 'package:movie_night/party.dart';

class User {
  String name;
  List<Movie> watchlist;
  List<Party> parties;

  User(this.name, this.watchlist, this.parties);
}
