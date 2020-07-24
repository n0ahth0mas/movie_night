import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:movie_night/core/models/party.dart';
import 'package:movie_night/core/models/user.dart';

class WatchlistWidget extends StatelessWidget {
  final User user;

  WatchlistWidget(this.user);

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: () => Navigator.pushNamed(context, 'watchlist'),
      text: "View Watchlist",
      shape: GFButtonShape.pills,
      fullWidthButton: true,
      size: GFSize.LARGE,
      color: Colors.blue,
    );
  }
}

class PartyCard extends StatelessWidget {
  final Party party;
  final int index;
  final imgs = ["bg1.png", "bg2.png", "bg3.png", "bg4.png"];

  PartyCard(this.party, this.index);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/${imgs[index % 4]}"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Text(
              party.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        //fix
        onPressed: () => {});
  }
}

class AddParty {
  final User user;
  final BuildContext context;

  AddParty(this.user, this.context);

  final TextEditingController textController = new TextEditingController();

  joinPartyDialogPopup() {
    showDialog(
        context: context,
        child: CupertinoAlertDialog(
            title: Column(
              children: <Widget>[
                Text("Join Party"),
                Padding(
                    padding: EdgeInsets.fromLTRB(1, 10, 1, 2),
                    child: CupertinoTextField(
                      controller: textController,
                      autocorrect: false,
                      clearButtonMode: OverlayVisibilityMode.editing,
                      placeholder: "Enter Party Code",
                    )),
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
                child: Text("Cancel"),
              ),
              CupertinoDialogAction(
                onPressed: () => joinparty(textController.text),
                child: Text("Submit"),
              ),
            ]));
  }

  final Party existingParty = Party("existing party", "abc");
  //add more functionality with a more defined system
  joinparty(String code) {
    if (code == existingParty.code) {
      existingParty.addUserToParty(user);

      //figure out how to refresh list
      //_refreshPartyList(user);

    } else {
      print("no");
    }
    Navigator.of(context).pop();
    textController.clear();
  }

  createParty(String name) {
    Party.withUser(name, user, "abc");

    //figure out how to refresh lish
    //_refreshPartyList(user);

    Navigator.of(context).pop();
    textController.clear();
  }

  newPartyDialog() {
    showDialog(
        context: context,
        child: CupertinoAlertDialog(
            title: Column(
              children: <Widget>[
                Text("Create Party"),
                Padding(
                    padding: EdgeInsets.fromLTRB(1, 10, 1, 2),
                    child: CupertinoTextField(
                      controller: textController,
                      autocorrect: false,
                      maxLength: 24,
                      maxLengthEnforced: true,
                      clearButtonMode: OverlayVisibilityMode.editing,
                      placeholder: "Enter Name of New Party",
                    )),
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
                child: Text("Cancel"),
              ),
              CupertinoDialogAction(
                onPressed: () => createParty(textController.text),
                child: Text("Create"),
              ),
            ]));
  }

  popup() {
    final action = CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
            child: Text("Create New Party"),
            isDefaultAction: true,
            onPressed: () => {
                  Navigator.pop(context),
                  newPartyDialog(),
                }),
        CupertinoActionSheetAction(
            child: Text("Join Party"),
            onPressed: () => {
                  Navigator.pop(context),
                  joinPartyDialogPopup(),
                })
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    return showCupertinoModalPopup(
        context: context, builder: (context) => action);
  }
}
