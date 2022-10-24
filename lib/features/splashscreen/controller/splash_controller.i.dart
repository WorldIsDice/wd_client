import 'package:wd_client/core/data/models/user.dart';
import 'package:wd_client/features/splashscreen/provider/splashloader.p.dart';

abstract class ISplashController {
  SplashLoader get splashLoader;
  void setLoadingPercent(double percentage);
  Future<User?> getUser();
  void launchHomeScreen();
}
