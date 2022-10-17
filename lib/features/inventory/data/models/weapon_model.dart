import 'package:wd_client/features/inventory/domain/entities/elements.dart';
import 'package:wd_client/features/inventory/domain/entities/weapon.dart';

class WeaponModel extends Weapon {
  WeaponModel({required super.id, required super.name, required super.atk, required super.type});

  factory WeaponModel.fromJson(Map<String, dynamic> json) {
    return WeaponModel(
      id: json["id"],
      name: json["name"],
      atk: json['atk'],
      type: getElement(json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "atk": atk,
      "type": type,
    };
  }
}
