import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final List<Color> colorAccents = [
    Colors.redAccent,
    Colors.tealAccent,
    Colors.orangeAccent,
    Colors.yellowAccent
  ];

  final List<Color> colors = [
    Colors.red[200],
    Colors.teal[200],
    Colors.orange[200],
    Colors.yellow[200]
  ];

  Widget _actions() {
    return GFButton(
      onPressed: () {},
      text: "View Watchlist",
      shape: GFButtonShape.pills,
      fullWidthButton: true,
      size: GFSize.LARGE,
      color: GFColors.INFO,
    );
  }

  Widget _partyCard(int index) {
    final imgs = ["bg1.png", "bg2.png", "bg3.png", "bg4.png"];
    final result = (index + 1) % 4;

    return CupertinoButton(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/${imgs[result]}"), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Text(
            "Mindfulness",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      onPressed: () {},
    );
  }
/*
  Widget _partyCard(int index) {
    int colorIndex = (index + 1) % 4;
    return GestureDetector(
        onTap: () => print("ooo"),
        child: Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            shadowColor: colorAccents[colorIndex],
            color: colors[colorIndex],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text("Name of group is this",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ],
                )))
        );
  }
  */

  _actionPrompt() {
    final action = CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("Create New Party"),
          isDefaultAction: true,
          onPressed: () {
            print("Action 1 is been clicked");
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Join Party"),
          onPressed: () {
            print("Action 2 is been clicked");
          },
        )
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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CupertinoNavigationBar(
          middle: FlutterLogo(
            size: 30,
          ),
          trailing: IconButton(
              icon: Icon(Icons.add_circle), onPressed: () => _actionPrompt()),
          automaticallyImplyLeading: false,
        ),
        body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: _actions(),
              ),
            ),
            SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return _partyCard(index);
                      },
                      childCount: 4,
                    )))
          ],
        ));
  }
}
