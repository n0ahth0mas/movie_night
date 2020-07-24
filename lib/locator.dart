import 'package:get_it/get_it.dart';
import 'package:movie_night/core/services/watchlist_service.dart';
import 'package:movie_night/core/viewmodels/home_model.dart';
import 'package:movie_night/core/viewmodels/removebtn_model.dart';
import 'package:movie_night/core/viewmodels/watchlist_model.dart';

import 'core/services/api.dart';
import 'core/services/authentication_service.dart';
import 'core/viewmodels/login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => WatchlistService());
  locator.registerLazySingleton(() => Api());

  locator.registerLazySingleton(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => RemoveButtonModel());
  locator.registerFactory(() => WatchlistModel());
}
