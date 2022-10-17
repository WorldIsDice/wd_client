import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wd_client/core/usecases/usecase.dart';
import 'package:wd_client/features/inventory/domain/repositories/weapon_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/weapon.dart';

class GetWeapon implements UseCase<Weapon, Params> {
  final WeaponRepository repository;

  GetWeapon(this.repository);

  @override
  Future<Either<Failure, Weapon>> call(Params params) async {
    return await repository.getWeapon(params.id);
  }
}

class Params extends Equatable {
  final int id;
  const Params({required this.id});

  @override
  List<Object?> get props => throw UnimplementedError();
}
