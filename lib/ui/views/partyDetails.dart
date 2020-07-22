import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night/core/models/party.dart';
import 'package:movie_night/core/models/user.dart';


class PartyDetails extends StatefulWidget {
  @override
  PartyDetailsState createState() => PartyDetailsState();
}

class PartyDetailsState extends State<PartyDetails> {
  final desc =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum non metus ut consectetur. Curabitur posuere turpis eget interdum pharetra. Donec tristique mauris felis, in sodales nunc ornare quis. Nunc ac odio nisl. Aliquam erat volutpat. Duis fermentum imperdiet feugiat. Maecenas vehicula leo ac scelerisque vehicula. Cras consequat justo et scelerisque egestas. Duis ornare tortor vitae velit lacinia pulvinar. Duis non velit leo. Nam at quam vel dui pellentesque imperdiet. Pellentesque luctus elit non malesuada dictum. Suspendisse hendrerit efficitur felis ut vestibulum. Pellentesque orci leo, lobortis sed dui sit amet, porta efficitur risus. Vestibulum euismod lacus pretium ipsum condimentum, id maximus sapien sollicitudin. Integer commodo, diam sit amet efficitur finibus, nulla diam ultrices risus, quis vestibulum nisl purus non diam. Aliquam tellus lacus, gravida vitae purus vitae, ultrices lobortis metus. Suspendisse rutrum ligula a enim posuere, nec posuere quam suscipit. Fusce arcu tellus, molestie vel felis a, consectetur tempus magna. Fusce ac rhoncus ante, sed convallis mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed congue molestie laoreet.";

  final movie =
      "https://cdn.shopify.com/s/files/1/1148/8924/products/MPW-115495-a_1024x1024.jpg?v=1571439886";
  final qmark =
      "https://i.ya-webdesign.com/images/question-mark-png-clear-background-4.png";

  _actionPrompt(Party party, User user) {
    final action = CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
            child: Text("View Group Watchlist"),
            isDefaultAction: true,
            onPressed: () => {}),
          CupertinoActionSheetAction(
            child: Text("Pick Movie"), onPressed: () => {})
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

    Party party = rcvdData["party"];
    User user = rcvdData["user"];

    return Scaffold(
        appBar: CupertinoNavigationBar(
            middle: Text(party.name),
            trailing: Material(
              color: Colors.transparent,
              child: IconButton(
                  icon: Icon(Icons.list), onPressed: () => _actionPrompt(party, user)),
            )),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Center(child: Image.network(qmark, height: 450)),
            Center(
                child: Container(
              padding: EdgeInsets.all(10),
              child:
                  Text("Title", style: Theme.of(context).textTheme.headline4),
            )),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Platform Icons",
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 100),
              child: Text(desc),
            ),
          ],
        )));
  }
}
