import 'package:http/http.dart' as http;
import 'package:movie_night/core/models/movie.dart';
import 'package:movie_night/core/models/movieList.dart';
import 'package:movie_night/core/models/party.dart';
import 'dart:async';

import 'package:movie_night/core/models/secret.dart';
import 'package:movie_night/core/models/user.dart';

Secret secret = Secret();

class Api {
  var client = new http.Client();

  Future<Movie> getMovie(String code) async {
    String url =
        "https://api.themoviedb.org/3/movie/$code?api_key=${secret.key}&language=en-US";

    var response = await http.get(url);
    if (response.statusCode == 200) {
      return movieFromJson(response.body);
    } else {
      throw Exception('Failed to Load');
    }
  }

  Future<List<Movie>> getMovieList(List<String> codeList) async {
    var moviesList = [];
    for (var code in codeList) {
      moviesList.add(getMovie(code));
    }
    return moviesList;
  }

  Future<List<Result>> getMovieListFromName(String name) async {
    await Future.delayed(Duration(seconds: 2));

    String url =
        "https://api.themoviedb.org/3/search/movie?api_key=${secret.key}&language=en-US&query=$name&page=1&include_adult=false";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      return movieListFromJson(response.body).results;
    } else {
      throw Exception('Failed to Load');
    }
  }

  User getUserProfile(String userId) {
    List<int> movieList = [
    496243, 122917
    ];
    //use this as the basis for authentication in the future (maybe change to new file?)
    return new User.initial();
  }
  
  List<Party> getPartyList(){
    var party = Party("My First Party", "abc");
    var party2 = Party("My Second Party", "abc");
    var party3 = Party("My Third Party", "abc");
    var party4 = Party("My Fourth Party", "abc");

    return [party, party2, party3, party4];
  }
}
