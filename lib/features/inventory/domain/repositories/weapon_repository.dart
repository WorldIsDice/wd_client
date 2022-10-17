import 'package:dartz/dartz.dart';
import 'package:wd_client/core/error/failure.dart';

import '../entities/weapon.dart';

abstract class WeaponRepository {
  Future<Either<Failure, Weapon>> getWeapon(int weaponId);
}
