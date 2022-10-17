import 'package:wd_client/core/error/exceptions.dart';
import 'package:wd_client/core/network/network_info.dart';
import 'package:wd_client/features/inventory/data/datasources/weapon_local_datasource.dart';
import 'package:wd_client/features/inventory/data/models/weapon_model.dart';
import 'package:wd_client/features/inventory/domain/entities/weapon.dart';
import 'package:wd_client/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:wd_client/features/inventory/domain/repositories/weapon_repository.dart';

import '../datasources/weapon_datasource.dart';

class WeaponRepositoryImpl implements WeaponRepository {
  final WeaponDatasource weaponDatasource;
  final WeaponLocalDatasource weaponLocalDatasource;
  final NetworkInfo networkInfo;

  WeaponRepositoryImpl({
    required this.weaponDatasource,
    required this.weaponLocalDatasource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Weapon>> getWeapon(int weaponId) async {
    if (await networkInfo.isConnected) {
      try {
        networkInfo.isConnected;
        final WeaponModel weapon = await weaponDatasource.getWeapon(weaponId);
        weaponLocalDatasource.cacheWeapon(weapon);
        return Right(weapon);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localWeapon = await weaponDatasource.getWeapon(weaponId);
        return Right(localWeapon);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
