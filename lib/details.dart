import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  DetailsState createState() => DetailsState();
}

class DetailsState extends State<Details> {
  final desc =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam elementum non metus ut consectetur. Curabitur posuere turpis eget interdum pharetra. Donec tristique mauris felis, in sodales nunc ornare quis. Nunc ac odio nisl. Aliquam erat volutpat. Duis fermentum imperdiet feugiat. Maecenas vehicula leo ac scelerisque vehicula. Cras consequat justo et scelerisque egestas. Duis ornare tortor vitae velit lacinia pulvinar. Duis non velit leo. Nam at quam vel dui pellentesque imperdiet. Pellentesque luctus elit non malesuada dictum. Suspendisse hendrerit efficitur felis ut vestibulum. Pellentesque orci leo, lobortis sed dui sit amet, porta efficitur risus. Vestibulum euismod lacus pretium ipsum condimentum, id maximus sapien sollicitudin. Integer commodo, diam sit amet efficitur finibus, nulla diam ultrices risus, quis vestibulum nisl purus non diam. Aliquam tellus lacus, gravida vitae purus vitae, ultrices lobortis metus. Suspendisse rutrum ligula a enim posuere, nec posuere quam suscipit. Fusce arcu tellus, molestie vel felis a, consectetur tempus magna. Fusce ac rhoncus ante, sed convallis mauris. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed congue molestie laoreet.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie Details"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                  child: Image.network(
                      "https://cdn.shopify.com/s/files/1/1148/8924/products/MPW-115495-a_1024x1024.jpg?v=1571439886",
                      width: 300)),
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child:  Text("Title",style: Theme.of(context).textTheme.headline4),
                )
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Rating", style: Theme.of(context).textTheme.headline5),
                  Text("Platforms", style: Theme.of(context).textTheme.headline5),
                ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 100),
                child:  Text(desc),
              ),
            ],
          )),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print("pressed"),
          child: Icon(Icons.add)),
        );
  }
}
