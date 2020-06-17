import 'package:flutter/material.dart';

class Party extends StatefulWidget {
  @override
  PartyState createState() => PartyState();
}

class PartyState extends State<Party> {
  Widget _partyList(int parties) {
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: parties,
      itemBuilder: (BuildContext context, int index) {
        return _partyRow("List $index");
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _partyRow(String name) {
    return Card(
        child: Container(
      padding: EdgeInsets.all(10),
      child: Text(name, style: Theme.of(context).textTheme.headline6),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: _partyList(20),
    ));
  }

}
