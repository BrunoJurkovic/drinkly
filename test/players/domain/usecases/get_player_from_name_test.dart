import 'package:dartz/dartz.dart';
import 'package:drinkly/players/domain/entities/player.dart';
import 'package:drinkly/players/domain/repositories/player_repository.dart';
import 'package:drinkly/players/domain/usecases/get_player_from_name.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPlayerRepository extends Mock implements PlayerRepository {}

void main() {
  late GetPlayerFromName usecase;
  late MockPlayerRepository repository;

  final tName = 'test';
  final tPlayer = Player(name: tName);

  setUp(() {
    repository = MockPlayerRepository();
    usecase = GetPlayerFromName(
      repository: repository,
    );
  });

  test(
    'should return Player when name is provided',
    () async {
      // arrange
      //
      /// When our usecase gets called, we must return the [Right]
      /// value of [tPlayer]
      when(() => repository.getPlayerFromName(tName)).thenAnswer(
        (_) => Right(tPlayer),
      );
      // act
      //
      /// Here we call our usecase
      final result = usecase(tName);
      // assert
      //
      /// Now we expect that the result of the above call to our usecase
      /// will be equal to the value of [Right<tPlayer>]
      expect(result, Right(tPlayer));

      /// We verify that we actually called our repo
      verify(() => repository.getPlayerFromName(any())).called(1);

      /// And now we verify that our code is not doing anything else after
      /// returning the value.
      verifyNoMoreInteractions(repository);
    },
  );
}
