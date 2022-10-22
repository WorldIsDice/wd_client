import 'package:flutter/material.dart';

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
    mobile = user.mobile;
    dob = user.dob;
    gender = user.gender;
    name = user.name;
  }

  int id;
  String? email;
  String? mobile;
  String? dob;
  String? gender;
  String? name;

  void copyFrom(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    mobile = json["mobile"];
    dob = json["dob"];
    gender = json["gender"];
    name = json["name"];

    notifyListeners();
  }

  setId(int id) {
    this.id = id;
    notifyListeners();
  }

  setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  setMobile(String mobile) {
    this.mobile = mobile;
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "mobile": mobile,
        "dob": dob,
        "gender": gender,
        "name": name,
      };
}
