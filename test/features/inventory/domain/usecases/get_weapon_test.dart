import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:wd_client/features/inventory/domain/entities/elements.dart';
import 'package:wd_client/features/inventory/domain/entities/weapon.dart';
import 'package:wd_client/features/inventory/domain/repositories/weapon_repository.dart';
import 'package:wd_client/features/inventory/domain/usecases/get_weapon.dart';

class MockGetWeapon extends Mock implements WeaponRepository {}

@GenerateMocks([MockGetWeapon])
Future<void> main() async {
  MockGetWeapon mockWeaponRepository = MockGetWeapon();
  GetWeapon usecase = GetWeapon(mockWeaponRepository);

  const int testNum = 1;

  final testWeapon = Weapon(
    id: 1,
    name: "Einherjar",
    atk: 10,
    type: Element.Holy,
  );

  test("should get weapon from the number", () async {
    when(mockWeaponRepository.getWeapon(testNum)).thenAnswer(
      (_) async => Right(testWeapon),
    );

    final result = await usecase(Params(id: testNum));

    expect(result, Right(testWeapon));
    verify(mockWeaponRepository.getWeapon(testNum));
    verifyNoMoreInteractions(mockWeaponRepository);
  });
}
