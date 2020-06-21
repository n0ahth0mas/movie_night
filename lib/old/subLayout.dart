import 'package:flutter/material.dart';
import 'package:movie_night/pages/watchlist.dart';

class SubLayout extends StatefulWidget {
  @override
  SubLayoutState createState() => SubLayoutState();
}

class SubLayoutState extends State<SubLayout> {
  int selectedIndex = 0;
  final List<Widget> _section = [
    Watchlist(),
    Watchlist(),
  ];
  
    void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
    
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FlutterLogo(
          size: 30,
        ),
      ),
      body: _section[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter), title: Text("Party Watchlist")),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_movies), title: Text("Ignored Items")),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
