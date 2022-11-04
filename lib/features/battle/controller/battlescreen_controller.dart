import 'package:wd_client/core/data/datasources/repositories/user_repository.dart';
import 'package:wd_client/core/data/datasources/routes/routes.dart';
import 'package:wd_client/core/data/models/monster.dart';
import 'package:wd_client/core/data/models/user.dart';
import 'package:wd_client/core/data/models/userstats.dart';
import 'package:wd_client/core/services/navigation_service.dart';
import 'package:wd_client/features/battle/controller/battlescreen_controller.i.dart';
import 'package:wd_client/features/battle/provider/battlescreen.p.dart';

class BattleScreenController implements IBattleScreenController {
  BattleScreenController({
    required this.user,
    required this.navigationService,
    required this.userRepository,
  }) {
    UserStats newUser = UserStats.copy(user.userStats);
    provider = BattleProvider(battleUserStats: newUser, monster: Monster.fakeMonster());
  }

  late BattleProvider provider;
  User user;
  final NavigationService navigationService;
  final UserRepository userRepository;

  @override
  void attackMonster() {
    int damage = 70;
    //TODO damage calculations
    showDamage(null, damage);
  }

  @override
  void attackUser() {
    int damage = 20;
    //TODO damage calculations
    showDamage(damage, null);
  }

  void saveProgress() async {
    //change global user exp
    //update local battleUser data
    //update user to cloud and local db

    // print("${user.toString()}");
    await userRepository.addExpPoints(provider.monster.exp);
    // user.userStats.skillStats.updateExp(provider.monster.exp);
    provider.updateUserStats(UserStats.copy(user.userStats));
  }

  void searchMonsters() {
    provider.spawnNewMonster();
  }

  @override
  void endBattle() {
    navigationService.pop(<String, dynamic>{});
    // navigationService.pop();
    // navigationService.popUntil(Routes.home);
    // navigationService.navigateTo(Routes.userprofile, arguments: <String, dynamic>{});
    // TODO: implement endBattle
  }

  void showDamage(int? userDamage, int? monsterDamage) {
    provider.displayDamage(userDamage: userDamage, monsterDamage: monsterDamage);
    Future.delayed(const Duration(milliseconds: 600), () {
      if (provider.battleEnded && provider.monsterCurrentHp == 0) {
        if (provider.monsterCurrentHp == 0) saveProgress();
        //TODO ELSE USER HP FALL TO 0
      }
      provider.displayDamage(userDamage: null, monsterDamage: null);
    });
  }
}
