import 'package:flutter/material.dart';
import 'package:movie_night/movie.dart';
import 'package:movie_night/party.dart';
import 'package:movie_night/partyList.dart';
import 'package:movie_night/user.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  List<Movie> movieList = [
    Movie(
        "Terminator",
        "https://images-na.ssl-images-amazon.com/images/I/71hL9hv3RPL._AC_SY679_.jpg",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum non metus ut consectetur. Curabitur posuere turpis eget interdum pharetra. Donec tristique mauris felis, in sodales nunc ornare quis. Nunc ac odio nisl. Aliquam erat volutpat. Duis fermentum imperdiet feugiat. Maecenas vehicula leo ac scelerisque vehicula. Cras consequat justo et scelerisque egestas. Duis ornare tortor vitae velit lacinia pulvinar. Duis non velit leo. Nam at quam vel dui pellentesque imperdiet. Pellentesque luctus elit non malesuada dictum. Suspendisse hendrerit efficitur felis ut vestibulum. Pellentesque orci leo, lobortis sed dui sit amet, porta efficitur risus. Vestibulum euismod lacus pretium ipsum condimentum, id maximus sapien sollicitudin. Integer commodo, diam sit amet efficitur finibus, nulla diam ultrices risus, quis vestibulum nisl purus non diam. Aliquam tellus lacus, gravida vitae purus vitae, ultrices lobortis metus. Suspendisse rutrum ligula a enim posuere, nec posuere quam suscipit. Fusce arcu tellus, molestie vel felis a, consectetur tempus magna. Fusce ac rhoncus ante, sed convallis mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed congue molestie laoreet.",
        "reviewwww",
        "platform"),
    Movie(
      "Avengers",
      "https://images-na.ssl-images-amazon.com/images/I/71niXI3lxlL._AC_SY741_.jpg",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum non metus ut consectetur. Curabitur posuere turpis eget interdum pharetra. Donec tristique mauris felis, in sodales nunc ornare quis. Nunc ac odio nisl. Aliquam erat volutpat. Duis fermentum imperdiet feugiat. Maecenas vehicula leo ac scelerisque vehicula. Cras consequat justo et scelerisque egestas. Duis ornare tortor vitae velit lacinia pulvinar. Duis non velit leo. Nam at quam vel dui pellentesque imperdiet. Pellentesque luctus elit non malesuada dictum. Suspendisse hendrerit efficitur felis ut vestibulum. Pellentesque orci leo, lobortis sed dui sit amet, porta efficitur risus. Vestibulum euismod lacus pretium ipsum condimentum, id maximus sapien sollicitudin. Integer commodo, diam sit amet efficitur finibus, nulla diam ultrices risus, quis vestibulum nisl purus non diam. Aliquam tellus lacus, gravida vitae purus vitae, ultrices lobortis metus. Suspendisse rutrum ligula a enim posuere, nec posuere quam suscipit. Fusce arcu tellus, molestie vel felis a, consectetur tempus magna. Fusce ac rhoncus ante, sed convallis mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed congue molestie laoreet.",
      "review",
      "platform",
    )
  ];
  
  var party = Party("my party", null, null, "abc");
  

  @override
  Widget build(BuildContext context) {
    var user = new User("Noah", movieList, [party]);

    return Scaffold(
        body: Center(
            child: RaisedButton(
                padding: const EdgeInsets.all(8.0),
                textColor: Colors.black,
                color: Colors.purple,
                child: Text("Login", style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.pushNamed(context, '/home',
                      arguments: {"user": user});
                })));
  }
}
