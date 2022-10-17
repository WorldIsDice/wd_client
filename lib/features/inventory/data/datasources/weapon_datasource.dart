import 'dart:convert';

import 'package:wd_client/core/error/exceptions.dart';
import 'package:wd_client/features/inventory/data/models/weapon_model.dart';
import 'package:http/http.dart' as http;

abstract class WeaponDatasource {
  ///Calls api and throws Server Exception for error codes
  Future<WeaponModel> getWeapon(int weaponId);
}

class WeaponDatasourceImpl implements WeaponDatasource {
  final http.Client client;

  WeaponDatasourceImpl({required this.client});

  @override
  Future<WeaponModel> getWeapon(int weaponId) async {
    final response = await client.get(
      Uri.http("http://google.com", "wow/wow"),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return WeaponModel.fromJson(jsonDecode(response.body));
    }

    throw ServerException();
  }
}
