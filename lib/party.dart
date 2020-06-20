import 'package:movie_night/movie.dart';
import 'package:movie_night/user.dart';

class Party {
  String name;
  List<Movie> watchlist;
  Movie selected;
  List<User> members = [];
  final String code;

  addUserToParty(User user) {
    this.members.add(user);
    user.addParty(this);
  }

  bool userIsMember(inputUser) {
    for (var user in members) {
      if (inputUser == user) return true;
    }
    return false;
  }

  getParty() {
    return this;
  }

  Party(this.name, this.code);
  Party.withUser(this.name, User user, this.code) {
    this.members.add(user);
    user.addParty(this);
  }
}
