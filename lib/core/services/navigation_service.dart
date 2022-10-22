import 'dart:async';

import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  final RouteObserver<ModalRoute<dynamic>> routeObserver = RouteObserver<ModalRoute<dynamic>>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop<T extends Object>([T? result]) {
    bool isFirstRoute = false;
    navigationKey.currentState?.popUntil((route) {
      isFirstRoute = route.isFirst;
      // if (route.settings.name == "TOAST_ROUTE_NAME") {
      //   return false;
      // }
      return true;
    });
    if (!isFirstRoute) return _navigationKey.currentState?.pop(result);
  }

  String? getCurrentRouteName() {
    String? routeName;
    navigationKey.currentState?.popUntil((route) {
      routeName = route.settings.name;
      return true;
    });

    return routeName;
  }

  void popToRoot() {
    return _navigationKey.currentState?.popUntil((route) {
      return route.isFirst;
    });
  }

  void popUntil(String routeName) {
    return _navigationKey.currentState?.popUntil((route) {
      return route.isFirst || route.settings.name == routeName;
    });
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateToRoute<T>(Route<T> route) {
    return _navigationKey.currentState!.push(route);
  }

  Future<dynamic> navigateToAndReplace(String routeName, {dynamic arguments}) {
    navigationKey.currentState?.popUntil((route) {
      // if (route.settings.name == TOAST_ROUTE_NAME) {
      //   return false;
      // }
      return true;
    });
    return Navigator.of(_navigationKey.currentContext!).pushReplacementNamed(routeName, arguments: arguments);
  }

  showLoader({Duration? maxTime}) {
    scheduleMicrotask(() {
      // _navigationKey.currentContext?.showLoader(
      //   Loader(
      //     child: HowzatLoader(),
      //   ),
      //   position: LoaderPosition.CENTER,
      //   displayDuration: maxTime ?? Duration(seconds: 10),
      // );
    });
  }

  hideLoader({bool isAsync = false}) {
    // if (isAsync) {
    //   scheduleMicrotask(() {
    //     _navigationKey.currentContext?.hideLoader();
    //   });
    // } else {
    //   _navigationKey.currentContext?.hideLoader();
    // }
  }

  launchErrorMessage({
    required String title,
    required String message,
    Widget? actionButton,
  }) {
    return showDialog(
      context: _navigationKey.currentContext!,
      builder: (context) => Container(), //TODO : ErrorDialog1(title, message, actionButton),
      useSafeArea: false,
    );
  }

  Future<dynamic> launchDialog({
    required Widget widget,
    bool barrierDismissible = true,
    RouteSettings? routeSettings,
  }) {
    return showDialog(
      context: _navigationKey.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (context) => widget,
      useSafeArea: false,
      routeSettings: routeSettings,
    );
  }
}
