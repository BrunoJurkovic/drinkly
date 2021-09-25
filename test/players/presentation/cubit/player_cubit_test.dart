// 📦 Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:drinkly/app/error/errors.dart';
import 'package:drinkly/players/data/repositories/player_repository_impl.dart';
import 'package:drinkly/players/domain/entities/player.dart';
import 'package:drinkly/players/domain/usecases/get_player_from_name.dart';
import 'package:drinkly/players/presentation/cubit/player_cubit.dart';

void main() {
  const tPlayer = Player(name: 'test');

  late GetPlayerFromName usecase;
  late PlayerRepositoryImpl repo;
  late PlayerCubit cubit;

  setUp(() {
    repo = PlayerRepositoryImpl();
    usecase = GetPlayerFromName(repository: repo);
    cubit = PlayerCubit(getPlayerFromName: usecase);
  });

  blocTest(
    'should start with an empty list of players.',
    build: () => PlayerCubit(getPlayerFromName: usecase),
    seed: () => <Player>[],
    expect: () => <Player>[],
  );
  blocTest(
    'should add player to the state when [addPlayer] is called',
    build: () => PlayerCubit(getPlayerFromName: usecase),
    act: (PlayerCubit cubit) => cubit.addPlayer(tPlayer.name),
    seed: () => <Player>[],
    expect: () => hasLength(1),
  );

  blocTest(
    'should remove player from the state when [removePlayer] is called',
    build: () => PlayerCubit(getPlayerFromName: usecase),
    seed: () => [tPlayer],
    act: (PlayerCubit cubit) => cubit.removePlayer(tPlayer.name),
    expect: () => [isEmpty],
  );

  test(
    'should throw error when adding player and the name is empty',
    () {
      // assert
      expect(() => cubit.addPlayer(''), throwsA(isA<NameError>()));
    },
  );
  test(
    'should throw error when removing a player and the name is empty',
    () {
      // assert
      expect(() => cubit.removePlayer(''), throwsA(isA<NameError>()));
    },
  );
}
