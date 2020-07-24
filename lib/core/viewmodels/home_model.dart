import 'package:movie_night/core/enums.dart';
import 'package:movie_night/core/models/party.dart';
import 'package:movie_night/core/models/user.dart';
import 'package:movie_night/core/services/api.dart';
import 'package:movie_night/core/viewmodels/base_model.dart';

import '../../locator.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Party> parties;

  //prob need to change things with this once firebase is attatched
  Future getParties(User user) async {
    setState(ViewState.Busy);
    parties = user.parties;
    setState(ViewState.Idle);
  }
}
