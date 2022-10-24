import 'package:wd_client/core/data/datasources/routes/routes.dart';
import 'package:wd_client/core/data/models/user.dart';
import 'package:wd_client/core/data/models/userstats.dart';
import 'package:wd_client/core/services/navigation_service.dart';
import 'package:wd_client/features/splashscreen/controller/splash_controller.i.dart';
import 'package:wd_client/features/splashscreen/provider/splashloader.p.dart';

class SplashController implements ISplashController {
  SplashController({
    required this.navigationService,
  });

  final NavigationService navigationService;
  final SplashLoader splashLoader = SplashLoader();

  @override
  Future<User?> getUser() async {
    //TODO makeservice and call respose
    Map<String, dynamic> testdata = {
      "id": 1,
      "key": "123",
      "email": "abc@mail.com",
      "dob": "01/01/0001",
      "gender": "M",
      "name": "PlayerName",
      "coins": 200,
      "gems": 10,
      "userStats": UserStats.fakeUser(),
    };
    return User.fromJson(testdata);
  }

  @override
  void setLoadingPercent(double percentage) {
    splashLoader.updateLoader(percentage);
  }

  @override
  void launchHomeScreen() {
    navigationService.navigateTo(Routes.home);
  }
}
