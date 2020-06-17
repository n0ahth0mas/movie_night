import 'package:flutter/material.dart';
import 'package:movie_night/partyList.dart';

class Layout extends StatefulWidget {
  @override
  LayoutState createState() => LayoutState();
}

class LayoutState extends State<Layout> {
  int selectedIndex = 0;
  final List<Widget> _section = [
    Party(),
    Container(
      child: Text("hello2"),
    ),    
    Container(
      child: Text("hello3"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FlutterLogo(
          size: 30,
        ),
        automaticallyImplyLeading: false,
      ),
      body: _section[selectedIndex],
      //Think about expanding the bottom nav with this https://codewithandrea.com/articles/2018-09-13-bottom-bar-navigation-with-fab/
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter), title: Text("My Watch Parties")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), title: Text("New Party")),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_movies), title: Text("My Watchlist")),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
