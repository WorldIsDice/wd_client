import 'package:flutter/cupertino.dart';
import 'package:wd_client/core/data/models/userstats.dart';

class Monster with ChangeNotifier {
  Monster();

  SkillStats stats = SkillStats();
  String name = "";
  int monsterTotalHp = 0;
  int level = 0;
  int exp = 0;

  void updateStats(SkillStats newStats) {
    stats = newStats;
    notifyListeners();
  }

  factory Monster.fakeMonster() {
    Monster monster = Monster();
    monster.name = "mr.Monster";
    monster.stats = SkillStats.fakeStats();
    monster.monsterTotalHp = monster.stats.edurance * 10;
    monster.level = 5;
    monster.exp = 14;
    return monster;
  }
}
