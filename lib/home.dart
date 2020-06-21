import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:movie_night/party.dart';
import 'package:movie_night/user.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final textController = TextEditingController();
  final imgs = ["bg1.png", "bg2.png", "bg3.png", "bg4.png"];
  List<Party> watchParties;

  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Widget _actions(User user) {
    return GFButton(
      onPressed: () => Navigator.pushNamed(context, '/watchlist',
          arguments: {"user": user}),
      text: "View Watchlist",
      shape: GFButtonShape.pills,
      fullWidthButton: true,
      size: GFSize.LARGE,
      color: GFColors.INFO,
    );
  }

  Widget _partyCard(int index, Party party, User user) {
    final result = (index + 1) % 4;

    return CupertinoButton(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/${imgs[result]}"),
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
      onPressed: () => Navigator.pushNamed(context, '/partyDetails',
          arguments: {"party": party, "user":user}),
    );
  }
  

  _joinPartyDialogPopup(User user) {
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
                onPressed: () => _joinparty(user, textController.text),
                child: Text("Submit"),
              ),
            ]));
  }

  _newPartyDialog(User user) {
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
                onPressed: () => _createParty(user, textController.text),
                child: Text("Create"),
              ),
            ]));
  }

  Party existingParty = Party("existing party", "abc");

  //add more functionality with a more defined system
  _joinparty(User user, String code) {
    if (code == existingParty.code) {
      existingParty.addUserToParty(user);
      _refreshPartyList(user);
    } else {
      print("no");
    }
    Navigator.of(context).pop();
    textController.clear();
  }

  _refreshPartyList(User user) {
    setState(() {
      watchParties = user.parties;
    });
  }

  _createParty(User user, String name) {
    Party.withUser(name, user, "abc");
    _refreshPartyList(user);
    Navigator.of(context).pop();
    textController.clear();
  }

  _actionPrompt(User user) {
    final action = CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
            child: Text("Create New Party"),
            isDefaultAction: true,
            onPressed: () => {
                  Navigator.pop(context),
                  _newPartyDialog(user),
                }),
        CupertinoActionSheetAction(
            child: Text("Join Party"),
            onPressed: () => {
                  Navigator.pop(context),
                  _joinPartyDialogPopup(user),
                })
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    showCupertinoModalPopup(context: context, builder: (context) => action);
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> rcvdData =
        ModalRoute.of(context).settings.arguments;

    User user = rcvdData["user"];
    //List<Party> partyList = _userParties(user, rcvdData["partyList"]);

    watchParties = user.parties;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CupertinoNavigationBar(
          middle: FlutterLogo(
            size: 30,
          ),
          trailing: Material(
              color: Colors.transparent,
              child: IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: () => _actionPrompt(user))),
          automaticallyImplyLeading: false,
        ),
        body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: _actions(user),
              ),
            ),
            SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    delegate: SliverChildBuilderDelegate(
                      (
                        BuildContext context,
                        int index,
                      ) {
                        return _partyCard(index, watchParties[index], user);
                      },
                      childCount: watchParties.length,
                    )))
          ],
        ));
  }
}
