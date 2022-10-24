import 'package:flutter/cupertino.dart';
import 'package:wd_client/features/inventory/domain/entities/elements.dart';

class UserStats with ChangeNotifier {
  UserStats();
  String currentArmor = "";
  String race = "";
  List<Map<String, int>> reputations = [];
  SkillStats skillStats = SkillStats();

  factory UserStats.fakeUser() {
    UserStats stats = UserStats();
    stats.currentArmor = "Vampire";
    stats.race = "Human";
    stats.reputations = [];
    stats.skillStats = SkillStats.fakeStats();
    return stats;
  }

  factory UserStats.fromJson(Map<String, dynamic> json) {
    UserStats userStats = UserStats();
    userStats.copyFrom(json);
    return userStats;
  }

  void copyFrom(Map<String, dynamic> json) {
    UserStats userStats = UserStats();
    userStats.currentArmor = json["currentArmor"];
    userStats.race = json["race"];
    userStats.reputations = json["reputations"];
    userStats.skillStats = SkillStats.fromJson(json["skillStats"]);
    notifyListeners();
  }
}

class SkillStats with ChangeNotifier {
  SkillStats() {
    elementalMastery.addEntries(GameElement.values.map((e) => MapEntry(e, 0)));
  }

  int strength = 0;
  int luck = 0;
  int edurance = 0;
  int intelligence = 0;
  Map<GameElement, int> elementalMastery = {};

  factory SkillStats.fakeStats() {
    SkillStats stats = SkillStats();
    stats.strength = 10;
    stats.edurance = 20;
    stats.luck = 30;
    stats.intelligence = 40;
    for (int i = 0; i < 7; i++) {
      stats.elementalMastery[getElement(i)] = 50 + 10 * i;
    }
    return stats;
  }

  factory SkillStats.fromJson(Map<String, dynamic> json) {
    SkillStats skillStats = SkillStats();
    skillStats.copyFrom(json);
    return skillStats;
  }

  void copyFrom(Map<String, dynamic> json) {
    SkillStats userStats = SkillStats();
    userStats.strength = json["strength"];
    userStats.edurance = json["edurance"];
    userStats.luck = json["luck"];
    userStats.intelligence = json["intelligence"];
    notifyListeners();
  }
}
