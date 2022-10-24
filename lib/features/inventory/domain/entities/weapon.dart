import 'package:equatable/equatable.dart';
import 'package:wd_client/features/inventory/domain/entities/elements.dart';

class Weapon extends Equatable {
  final int id;
  final String name;
  final int atk;
  final GameElement type;

  Weapon({
    required this.id,
    required this.name,
    required this.atk,
    required this.type,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
