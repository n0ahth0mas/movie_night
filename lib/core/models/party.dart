import 'user.dart';

import 'movie.dart';

class Party {
  String name;
  List<Movie> watchlist;
  Movie selected;
  List<User> members = [];
  List<User> admin = [];
  final String code;

  addUserToParty(User user) {
    this.members.add(user);
    user.addParty(this);
  }

  bool userIsMember(User user) {
    return members.contains(user);
  }

  bool isAdmin(User user) {
    return members.contains(user);
  }

  Party(this.name, this.code);

  Party.withUser(this.name, User user, this.code) {
    this.members.add(user);
    admin.add(user);
    user.addParty(this);
  }
}
