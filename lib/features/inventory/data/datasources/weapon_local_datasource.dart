import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wd_client/core/error/exceptions.dart';

import '../../../../core/error/failure.dart';
import '../models/weapon_model.dart';

abstract class WeaponLocalDatasource {
  Future<WeaponModel> getLocalWeapon();
  Future<void> cacheWeapon(WeaponModel weaponModel);
}

const CACHED_WEAPON = "CACHED_WEAPON";

class WeaponLocalDatasourceImpl implements WeaponLocalDatasource {
  final SharedPreferences sharedPreferences;

  WeaponLocalDatasourceImpl(this.sharedPreferences);

  @override
  Future<WeaponModel> getLocalWeapon() {
    final weaponJson = sharedPreferences.getString(CACHED_WEAPON);

    if (weaponJson != null) {
      return Future.value(WeaponModel.fromJson(jsonDecode(weaponJson)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheWeapon(WeaponModel weaponModel) {
    return sharedPreferences.setString(CACHED_WEAPON, json.encode(weaponModel.toJson()));
  }
}
