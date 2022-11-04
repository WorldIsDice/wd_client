import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wd_client/core/data/datasources/repositories/user_repository.dart';
import 'package:wd_client/core/data/models/user.dart';
import 'package:wd_client/core/services/navigation_service.dart';
import 'package:wd_client/core/theme/theme.dart';
import 'package:wd_client/features/home/homepage.dart';

import 'core/data/datasources/routes/app_routes.dart';
import 'core/data/datasources/routes/approute.i.dart';
import 'core/services/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase initialize
  await setupLocator();

  final NavigationService navigationService = locator.get<NavigationService>();
  final User user = locator.get<User>();
  final UserRepository userRepository = locator.get<UserRepository>();

  final approute = AppRoutes<dynamic>(
    user: user,
    userRepository: userRepository,
    // httpManager: _httpManager,
    // locationManager: _locationManager,
    // analyticsManager: _analyticsManager,
    navigationService: navigationService,
    // routeManager: routeManager,
    // repository: _repository,
    // lobbyKey: lobbyKey,
  );

  final Widget _materialApp = ScreenUtilInit(
    designSize: const Size(1080, 1920),
    builder: ((context, child) {
      return MaterialApp(
          builder: (BuildContext context, Widget? child) {
            return child!;
          },
          theme: getInitTheme(),
          navigatorObservers: <NavigatorObserver>[navigationService.routeObserver],
          navigatorKey: navigationService.navigationKey,
          home: approute.getHomeWidget(),
          onGenerateRoute: (RouteSettings settings) {
            return approute.getRouteFor(settings);
          });
    }),
  );

  runApp(_materialApp);
}
