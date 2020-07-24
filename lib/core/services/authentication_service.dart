import 'dart:async';

import 'package:movie_night/core/models/user.dart';
import 'package:movie_night/core/services/api.dart';

import '../../locator.dart';

class AuthenticationService {
  //inject API

  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(String userId) async {
    //get user profile for id
    var fetchedUser = await _api.getUserProfile(userId);

    //check if success
    var hasUser = fetchedUser != null;

    if (hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}
