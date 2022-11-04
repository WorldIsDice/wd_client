import 'package:flutter/cupertino.dart';
import 'package:wd_client/core/data/models/monster.dart';
import 'package:wd_client/core/data/models/userstats.dart';

class BattleProvider with ChangeNotifier {
  BattleProvider({
    required this.battleUserStats,
    required this.monster,
  }) {
    userTotalHp = battleUserStats.skillStats.edurance * 10;
    userTotalMp = battleUserStats.skillStats.intelligence * 8;
    userCurrentHp = userTotalHp;
    userCurrentMp = userTotalMp;

    monsterTotalHp = monster.stats.edurance * 10;
    monsterTotalMp = monster.stats.intelligence * 8;
    monsterCurrentHp = monsterTotalHp;
    monsterCurrentMp = monsterTotalMp;
  }

  UserStats battleUserStats;
  Monster monster;
  late int userTotalHp;
  late int userCurrentHp;
  late int userTotalMp;
  late int userCurrentMp;
  late int monsterTotalHp;
  late int monsterCurrentHp;
  late int monsterTotalMp;
  late int monsterCurrentMp;

  int? userDamage = null;
  int? monsterDamage = null;
  bool battleEnded = false;

  void displayDamage({
    required int? userDamage,
    required int? monsterDamage,
  }) {
    this.userDamage = userDamage;
    this.monsterDamage = monsterDamage;

    if (userDamage != null) {
      userCurrentHp = userCurrentHp - userDamage;
    }
    if (monsterDamage != null) {
      monsterCurrentHp = monsterCurrentHp - monsterDamage;
    }

    userCurrentHp = userCurrentHp < 0 ? 0 : userCurrentHp;
    monsterCurrentHp = monsterCurrentHp < 0 ? 0 : monsterCurrentHp;
    battleEnded = (userCurrentHp == 0 || monsterCurrentHp == 0);
    notifyListeners();
  }

  updateUserStats(UserStats newUserStats) {
    battleUserStats = newUserStats;
    notifyListeners();
  }

  spawnNewMonster() {
    monster = Monster.fakeMonster();
    monsterTotalHp = monster.stats.edurance * 10;
    monsterCurrentHp = monsterTotalHp;
    battleEnded = false;
    notifyListeners();
  }
}
