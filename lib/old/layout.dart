/*
import 'package:flutter/material.dart';
import 'package:movie_night/ui/views/partyList.dart';
import 'package:movie_night/ui/views/watchlist.dart';

class Layout extends StatefulWidget {
  @override
  LayoutState createState() => LayoutState();
}

class LayoutState extends State<Layout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    final List<Widget> _section = [
      PartyList(),
      Watchlist(),
  ];


    return Scaffold(
      appBar: AppBar(
        title: FlutterLogo(
          size: 30,
        ),
        automaticallyImplyLeading: false,
      ),
      body: _section[selectedIndex],
      //Think about expanding the bottom nav with this https://codewithandrea.com/articles/2018-09-13-bottom-bar-navigation-with-fab/
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter), title: Text("My Watch Parties")),
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
*/
