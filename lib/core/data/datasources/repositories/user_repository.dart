import 'dart:convert';
import 'package:wd_client/core/data/datasources/shared_pref/shared_pref_key.dart';
import 'package:wd_client/core/data/datasources/shared_pref/shared_preferences.dart';
import 'package:wd_client/core/data/models/user.dart';
import 'package:wd_client/core/data/models/userstats.dart';
import 'package:wd_client/core/services/service_locator.dart';

class UserRepository {
  UserRepository();
  SharedPrefHelper sharedPrefHelper = SharedPrefHelper();
  User currentUser = locator.get<User>();

  Future<void> updateUser(User newUser) async {
    // User currentUser = locator.get<User>();
    // currentUser.copy(newUser);

    //TODO SAVE TO CLOUD

    //SAVE LOCAL
    Map<String, dynamic> mp = newUser.toJson();

    String encoded = jsonEncode(mp);

    await sharedPrefHelper.saveToSharedPref(SharedPrefKey.offlineUser, encoded);
  }

  Future<void> addExpPoints(int addExp) async {
    int currentExp = currentUser.userStats.skillStats.exp;
    currentExp = currentExp + addExp;
    if (currentExp > 100) {
      currentExp = currentExp % 100;
      currentUser.userStats.incrementLevel();
    }
    currentUser.userStats.skillStats.exp = currentExp;
    currentUser.userStats.skillStats.confirmChanges();
    updateUser(currentUser);
  }

  Future<User> getUser() async {
    // Map<String, dynamic> testdata = {
    //   "id": 1,
    //   "key": "123",
    //   "email": "abc@mail.com",
    //   "dob": "01/01/0001",
    //   "gender": "M",
    //   "name": "PlayerName",
    //   "coins": 200,
    //   "gems": 10,
    //   "userStats": UserStats.fakeUser(),
    // };

    // String testUserString = jsonEncode(testdata);

    // await sharedPrefHelper.saveToSharedPref(SharedPrefKey.offlineUser, testUserString);

    String testUserDecodeString = await sharedPrefHelper.getFromSharedPref(SharedPrefKey.offlineUser);
    Map<String, dynamic> offlineuser = jsonDecode(testUserDecodeString);

    return User.fromJson(offlineuser);
  }
}
