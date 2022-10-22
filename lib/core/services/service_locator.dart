import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:wd_client/core/data/models/user.dart';
import 'package:wd_client/core/services/navigation_service.dart';

GetIt locator = GetIt.I;
Completer<void> locatorReady = Completer<void>();

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => User(id: -1));
}
