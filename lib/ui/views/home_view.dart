import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_night/core/models/user.dart';
import 'package:movie_night/core/viewmodels/home_model.dart';
import 'package:movie_night/ui/views/base_view.dart';
import 'package:movie_night/ui/widgets/home_widgets.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
        onModelReady: (model) {
          model.getParties(Provider.of<User>(context));
        },
        builder: (context, model, child) => Scaffold(
            resizeToAvoidBottomInset: false,
            body: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  largeTitle: Text("My Watch Parties"),
                  trailing: Material(
                      color: Colors.transparent,
                      child: IconButton(
                          icon: Icon(CupertinoIcons.plus_circled),
                          color: Colors.blue,
                          onPressed: () =>
                              AddParty(Provider.of<User>(context), context)
                                  .popup())),
                  automaticallyImplyLeading: false,
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: WatchlistWidget(Provider.of<User>(context)),
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
                            return PartyCard(
                                Provider.of<User>(context).getParty(index),
                                index);
                          },
                          childCount: Provider.of<User>(context).parties.length,
                        )))
              ],
            )));
  }
}
