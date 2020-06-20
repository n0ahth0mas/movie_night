import 'package:flutter/material.dart';

class PartyList extends StatefulWidget {
  @override
  PartyListState createState() => PartyListState();
}

class PartyListState extends State<PartyList> {
  var namesList = ["My First Party", "Me and my Friends"];

  Widget _partyList(List<String> parties) {
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: parties.length,
      itemBuilder: (BuildContext context, int index) {
        return _partyRow(parties[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _partyRow(String name) {
    return InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          "/partyDetails", arguments: {"name": name}
        ),
        child: Card(
            child: Container(
          padding: EdgeInsets.all(10),
          child: Text(name, style: Theme.of(context).textTheme.headline6),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: _partyList(namesList),
    ));
  }
}
