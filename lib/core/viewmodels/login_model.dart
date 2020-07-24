import 'package:movie_night/core/services/authentication_service.dart';
import 'package:movie_night/core/viewmodels/base_model.dart';

import '../../locator.dart';
import '../enums.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    if (userIdText == "false") {
      errorMessage = 'False Message';
      setState(ViewState.Idle);
      return false;
    }

    var success = await _authenticationService.login(userIdText);

    //handle potential error here too

    setState(ViewState.Idle);
    return success;
  }
}
