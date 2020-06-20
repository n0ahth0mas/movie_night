import 'package:movie_night/movie.dart';
import 'package:movie_night/user.dart';

class Party {
  String name;
  List<Movie> watchlist;
  Movie selected;
  List<User> members;
  final String code;

  Party(this.name, this.watchlist, this.selected, this.code);
}
