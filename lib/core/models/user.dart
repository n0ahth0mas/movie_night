import 'movie.dart';
import 'party.dart';

class User {
  String name;
  int id;
  List<String> watchlistId = [];
  List<Party> parties = [];
  User({this.name, this.id, this.watchlistId});

  static var party = Party("My First Party", "abc");
  static var party2 = Party("My Second Party", "abc");
  static var party3 = Party("My Third Party", "abc");
  static var party4 = Party("My Fourth Party", "abc");

  User.initial()
      : name = "",
        id = 0,
        watchlistId = ["270303"],
        parties = [party, party2, party3, party4];

  addParty(Party party) {
    this.parties.add(party);
  }

  getParty(int index) {
    if (parties[index] != null) {
      return parties[index];
    }
  }

  deleteFromWatchlist(String id) {
    watchlistId.remove(id);
  }

  addToWatchList(String id) {
    watchlistId.add(id);
  }

  bool inWatchlist(Movie movie) {
    return (watchlistId.contains(movie.id.toString()));
  }
}
