import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:wd_client/features/inventory/domain/entities/elements.dart';

class UserStats with ChangeNotifier {
  UserStats();

  String currentArmor = "";
  String race = "";
  Map<String, int> reputations = {};
  SkillStats skillStats = SkillStats();
  int level = 0;
  void confirmChanges() => notifyListeners();

  factory UserStats.fakeUser() {
    UserStats stats = UserStats();
    stats.currentArmor = "Vampire";
    stats.race = "Human";
    stats.reputations = {"Ranamin": 3};
    stats.skillStats = SkillStats.fakeStats();
    stats.level = 1;
    return stats;
  }

  factory UserStats.copy(UserStats stats) {
    UserStats userstats = UserStats();
    userstats.currentArmor = stats.currentArmor;
    userstats.race = stats.race;
    userstats.reputations = stats.reputations;
    userstats.skillStats = stats.skillStats;
    userstats.level = stats.level;
    return userstats;
  }

  factory UserStats.fromJson(Map<String, dynamic> json) {
    UserStats userStats = UserStats();
    userStats.copyFrom(json);
    return userStats;
  }

  void copyFrom(Map<String, dynamic> json) {
    Map<String, int> repuMap = (json["reputations"] as Map<String, dynamic>).map((String key, dynamic value) => MapEntry(key, cast<int>(value)));
    currentArmor = json["currentArmor"];
    race = json["race"];
    reputations = repuMap;
    skillStats = SkillStats.fromJson(json["skillStats"]);
    level = json["level"];
    notifyListeners();
  }

  void incrementLevel() {
    level = level + 1;
    notifyListeners();
  }

  Map<String, dynamic> toJson() => {
        "currentArmor": currentArmor,
        "race": race,
        "reputations": reputations,
        "skillStats": skillStats,
        "level": level,
      };

  @override
  String toString() {
    return '"userStats" : {"currentArmor": $currentArmor, "race": $race, "reputations": ${jsonEncode(reputations)}}, ${skillStats.toString()}, "level": $level }';
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
  int exp = 0;
  Map<GameElement, int> elementalMastery = {};

  void confirmChanges() => notifyListeners();

  factory SkillStats.fakeStats() {
    SkillStats stats = SkillStats();
    stats.strength = 10;
    stats.edurance = 20;
    stats.luck = 30;
    stats.intelligence = 40;
    for (int i = 0; i < 7; i++) {
      stats.elementalMastery[getElement(i)] = 50 + 10 * i;
    }
    stats.exp = 10;
    return stats;
  }

  factory SkillStats.fromJson(Map<String, dynamic> json) {
    SkillStats skillStats = SkillStats();
    skillStats.copyFrom(json);
    return skillStats;
  }

  void copyFrom(Map<String, dynamic> json) {
    strength = json["strength"];
    edurance = json["edurance"];
    luck = json["luck"];
    intelligence = json["intelligence"];
    exp = json["exp"];
    notifyListeners();
  }

  Map<String, dynamic> toJson() => {
        "strength": strength,
        "edurance": edurance,
        "luck": luck,
        "intelligence": intelligence,
        "exp": exp,
      };

  @override
  String toString() {
    return '"skillStats" : {"strength": $strength, "edurance": $edurance, "luck": $luck,  "intelligence": $intelligence,  "exp": $exp }';
  }
}
