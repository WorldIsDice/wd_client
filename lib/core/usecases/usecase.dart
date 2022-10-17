import 'package:dartz/dartz.dart';
import 'package:wd_client/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
