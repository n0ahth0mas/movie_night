import 'package:flutter/material.dart';
import 'package:movie_night/details.dart';

class Watchlist extends StatefulWidget {
  @override
  WatchlistState createState() => WatchlistState();
}

class WatchlistState extends State<Watchlist> {
  Widget _createWatchlist(int movies) {
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: movies,
      itemBuilder: (BuildContext context, int index) {
        return _watchlistRow("List $index");
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

Widget _movie(String link){
  return Container(
      child: InkWell(
          onTap: () =>
              Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  Details())),
          child: Image.network(link, width: 160)));
}

  Widget _watchlistRow(String name) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _movie("https://cdn.shopify.com/s/files/1/1148/8924/products/MPW-115495-a_1024x1024.jpg?v=1571439886"),
          _movie("https://cdn.shopify.com/s/files/1/1148/8924/products/MPW-115495-a_1024x1024.jpg?v=1571439886"),

        ]);
  }

  @override
  Widget build(BuildContext context) {
    return _createWatchlist(10);
  }
}
