import 'package:flutter/material.dart';

abstract class IAppRoutes<T> {
  IAppRoutes();

  Widget getHomeWidget();

  PageRouteBuilder<T> getRouteFor<T1>(RouteSettings settings);
}
