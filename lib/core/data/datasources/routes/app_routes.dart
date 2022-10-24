import 'package:flutter/material.dart';
import 'package:wd_client/core/data/datasources/routes/approute.i.dart';
import 'package:wd_client/core/data/datasources/routes/routes.dart';
import 'package:wd_client/core/data/models/user.dart';
import 'package:wd_client/core/services/navigation_service.dart';
import 'package:wd_client/features/battle/battleScreen.dart';
import 'package:wd_client/features/home/homepage.dart';
import 'package:wd_client/features/splashscreen/splashscreen.dart';
import 'package:wd_client/features/userprofile/userprofile.dart';

class AppRoutes<T> implements IAppRoutes<T> {
  AppRoutes({
    required this.user,

    // required CoreHttpManager httpManager,
    // required LocationManager locationManager,
    // required CoreAnalyticsManager analyticsManager,
    required this.navigationService,
    // required RouteManager routeManager,
    // required this.fallback,
    // required IRepository repository,
    // required this.lobbyKey,
  });

  final User user;
  final NavigationService navigationService;

  // late final RouteManager _routeManager;
  // late final CoreHttpManager _httpManager;
  // late final LocationManager _locationManager;
  // late final CoreAnalyticsManager _analyticsManager;
  // late final IRepository _repository;

  // final FantasyDatabaseManager _fantasyDatabaseManager = locator.get<FantasyDatabaseManager>();
  // final DataStore _dataStore = locator.get();

  @override
  PageRouteBuilder<T> getRouteFor<T1>(RouteSettings settings) {
    Widget widget;
    // Map<String, dynamic> arguments = settings.arguments as Map<String, dynamic>;
    // double textScaleFactor = 0.95;

    switch (settings.name?.toLowerCase()) {
      case Routes.home:
        widget = HomePage(
          navigationservice: navigationService,
          user: user,
          // title: arguments["title"],
          // message: arguments["message"],
        );
        break;
      case Routes.userprofile:
        widget = UserProfile(
          navigationservice: navigationService,
          user: user,
          // title: arguments["title"],
          // message: arguments["message"],
        );
        break;
      case Routes.battlescreen:
        widget = BattleScreen(
          navigationservice: navigationService,
          // title: arguments["title"],
          // message: arguments["message"],
        );
        break;
      // case Routes.siginin:
      //   widget = SignInPage(
      //     appConfig: _appConfig,
      //     routeManager: _routeManager,
      //   );
      //   break;
      default:
        widget = HomePage(
          navigationservice: navigationService,
          user: user,
        );
      // default:
      //   return fallback(settings, _repository, _routeManager, _httpManager, _analyticsManager);
    }

    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      settings: RouteSettings(
        name: settings.name?.toLowerCase(),
      ),
    );
  }

  Widget withMediaQuery({required BuildContext context, required Widget child, double? textScaleFactor}) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: textScaleFactor ?? 0.95,
      ),
      child: child,
    );
  }

  @override
  Widget getHomeWidget() {
    return SplashScreen(
      navigationService: navigationService,
    );

    // HomePage(
    //   navigationservice: navigationService,
    //   user: user,
    // );
    // return SplashScreensw(
    //   appConfig: _appConfig,
    //   routeManager: _routeManager,
    //   analyticsManager: _analyticsManager,
    //   httpManager: _httpManager,
    //   navigationService: _navigationService,
    // );
  }
}
