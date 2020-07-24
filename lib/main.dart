import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_night/locator.dart';
import 'package:movie_night/ui/router.dart';
import 'package:provider/provider.dart';

import 'core/models/user.dart';
import 'core/services/authentication_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
        initialData: User.initial(),
        create: (BuildContext context) =>
            locator<AuthenticationService>().userController.stream,
        child: MaterialApp(
          title: "Movie App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.grey,
              textTheme: GoogleFonts.latoTextTheme(
                Theme.of(context).textTheme,
              )),
          initialRoute: "login",
          onGenerateRoute: Router.generateRoute,
        ));
  }
}
