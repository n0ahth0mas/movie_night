import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_night/splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple[100],
        textTheme: GoogleFonts.ubuntuTextTheme(
          Theme.of(context).textTheme,
        )), 
      home: Splash());
  }
  
  
}

