import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night/core/models/movie.dart';
import 'package:movie_night/core/models/user.dart';
import 'package:movie_night/core/viewmodels/removebtn_model.dart';
import 'package:movie_night/ui/views/base_view.dart';
import 'package:provider/provider.dart';

class RemoveButton extends StatelessWidget {
  final Movie movie;
  RemoveButton(this.movie);

  _showDialog(String id, bool inWatchlist, BuildContext context,
      RemoveButtonModel model) {
    if (inWatchlist) {
      showDialog(
          context: context,
          child: CupertinoAlertDialog(
              title: Text("Remove from your watchlist?"),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                  child: Text("Cancel"),
                ),
                CupertinoDialogAction(
                  textStyle: TextStyle(color: Colors.red),
                  onPressed: () => _deletelist(id, context, model),
                  child: Text("Remove"),
                )
              ]));
    } else {
      showDialog(
          context: context,
          child: CupertinoAlertDialog(
              title: Text("Add to your watchlist?"),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                  child: Text("Cancel"),
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () => _addList(id, context, model),
                  child: Text("Add"),
                )
              ]));
    }
  }

  _deletelist(String id, BuildContext context, RemoveButtonModel model) {
    model.removeMovie(movie);
    Provider.of<User>(context).deleteFromWatchlist(id);
    //Navigator.pushNamed(context, 'watchlist');
    Navigator.popUntil(context, ModalRoute.withName('watchlist'));
  }

  _addList(String id, BuildContext context, RemoveButtonModel model) {
    model.addMovie(movie);
    Provider.of<User>(context).addToWatchList(id);
    Navigator.popUntil(context, ModalRoute.withName('watchlist'));
  }

  Widget _rightBtn(Movie movie, BuildContext context, RemoveButtonModel model) {
    if (Provider.of<User>(context).inWatchlist(movie)) {
      return IconButton(
          icon: Icon(Icons.remove_circle),
          color: Colors.blue,
          onPressed: () =>
              _showDialog(movie.id.toString(), true, context, model));
    } else {
      return IconButton(
          icon: Icon(Icons.add_circle),
          color: Colors.blue,
          onPressed: () =>
              _showDialog(movie.id.toString(), false, context, model));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<RemoveButtonModel>(
      builder: (context, model, child) => _rightBtn(movie, context, model),
    );
  }
}
