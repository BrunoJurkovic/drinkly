import 'package:dartz/dartz.dart';
import 'package:drinkly/players/data/repositories/player_repository_impl.dart';
import 'package:drinkly/players/domain/entities/player.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPlayerRepositoryImpl extends Mock implements PlayerRepositoryImpl {}

void main() {
  late MockPlayerRepositoryImpl repo;

  setUp(() {
    repo = MockPlayerRepositoryImpl();
  });

  const tName = 'test';
  const tPlayer = Player(name: tName);
  test(
    'should return Player with the required name when called.',
    () async {
      // arrange
      when(() => repo.getPlayerFromName(tName)).thenAnswer(
        (_) => const Right(tPlayer),
      );
      // act
      final result = repo.getPlayerFromName(tName);
      // assert
      expect(result, const Right(tPlayer));
    },
  );
}
