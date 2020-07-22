import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:movie_night/objects/movie.dart';
import 'package:movie_night/objects/movieList.dart';
import 'package:movie_night/objects/secret.dart';

Secret secret = Secret();

Future<Movie> getMovie(String code) async {
  String url =
      "https://api.themoviedb.org/3/movie/$code?api_key=${secret.key}&language=en-US";

  final response = await http.get(url);
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
