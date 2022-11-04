import 'package:flutter/material.dart';
import 'package:wd_client/core/data/datasources/routes/routes.dart';
import 'package:wd_client/core/data/models/user.dart';
import 'package:wd_client/core/services/navigation_service.dart';
import 'package:wd_client/core/services/service_locator.dart';
import 'package:wd_client/core/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:wd_client/features/splashscreen/controller/splash_controller.dart';
import 'package:wd_client/features/splashscreen/controller/splash_controller.i.dart';
import 'package:wd_client/features/splashscreen/provider/splashloader.p.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({
    required this.navigationService,
    Key? key,
  }) : super(key: key);

  final NavigationService navigationService; // = locator.get<NavigationService>();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ISplashController splashController;
  final User _user = locator.get<User>();

  @override
  void initState() {
    splashController = SplashController(
      navigationService: widget.navigationService,
    );

    onInitState();

    super.initState();
  }

  Future<void> onInitState() async {
    splashController.setLoadingPercent(1.0);
    // await Future.delayed(const Duration(seconds: 2), () {});
    // splashController.setLoadingPercent(10.0);
    // await Future.delayed(const Duration(seconds: 2), () {});
    // splashController.setLoadingPercent(40.0);
    await Future.delayed(const Duration(seconds: 2), () {});
    User? user = await splashController.getUser();
    if (user != null) {
      _user.copy(user);
    }
    splashController.setLoadingPercent(80.0);
    await Future.delayed(const Duration(seconds: 2), () {});
    splashController.setLoadingPercent(100.0);
    await Future.delayed(const Duration(seconds: 2), () {});
    splashController.launchHomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<SplashLoader>.value(
      value: splashController.splashLoader,
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: Colors.amber,
                          margin: const EdgeInsets.all(30),
                          child: Consumer<SplashLoader>(builder: (context, splashloader, child) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: (splashloader.loadedPercentage).toInt(),
                                  child: Container(
                                    height: 20,
                                    color: Colors.red,
                                  ),
                                ),
                                Expanded(
                                  flex: (100 - splashloader.loadedPercentage).toInt(),
                                  child: Container(
                                    height: 20,
                                    color: Colors.green,
                                  ),
                                )
                              ],
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
