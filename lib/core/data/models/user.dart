import 'package:flutter/material.dart';
import 'package:wd_client/core/data/models/userstats.dart';

class User with ChangeNotifier {
  User({required this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    User user = User(id: -1);
    user.copyFrom(json);
    return user;
  }

  void copy(User user) {
    id = user.id;
    email = user.email;
    key = user.key;
    dob = user.dob;
    gender = user.gender;
    name = user.name;
    coins = user.coins;
    gems = user.gems;
    userStats = user.userStats;
  }

  int id = -1;
  String email = "";
  String key = "";
  String dob = "";
  String gender = "";
  String name = "";
  int coins = 0;
  int gems = 0;
  UserStats userStats = UserStats();

  void copyFrom(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    key = json["key"];
    dob = json["dob"];
    gender = json["gender"];
    name = json["name"];
    coins = json["coins"];
    gems = json["gems"];
    userStats = UserStats.fromJson(json["userStats"]);
    notifyListeners();
  }

  setId(int id) {
    this.id = id;
    notifyListeners();
  }

  setKey(String key) {
    this.key = name;
    notifyListeners();
  }

  setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  setDob(String dob) {
    this.dob = dob;
    notifyListeners();
  }

  setGender(String gender) {
    this.gender = gender;
    notifyListeners();
  }

  setName(String name) {
    this.name = name;
    notifyListeners();
  }

  setCoins(int coins) {
    this.coins = coins;
    notifyListeners();
  }

  setGems(int gems) {
    this.gems = gems;
    notifyListeners();
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "email": email,
        "dob": dob,
        "gender": gender,
        "name": name,
        "coins": coins,
        "gems": gems,
        "userStats": userStats,
      };

  @override
  String toString() {
    return '"user" : {"id": $id, "key": $key, "email": $email, "dob": $dob, "gender": $gender, "name": $name, "coins": $coins, "gems": $gems, ${userStats.toString()}}';
  }
}
