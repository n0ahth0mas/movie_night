import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:movie_night/movie.dart';
import 'package:movie_night/secret.dart';

Secret secret = Secret();

Future<Movie> getMovie(String code) async {
  String url =
    "https://api.themoviedb.org/3/movie/$code?api_key=${secret.key}&language=en-US";
  
  final response = await http.get(url);
  return movieFromJson(response.body);
}
