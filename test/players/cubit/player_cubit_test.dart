import 'package:bloc_test/bloc_test.dart';
import 'package:drinkly/players/cubit/player_cubit.dart';
import 'package:drinkly/players/models/player.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PlayerCubit? cubit;

  setUp(() {
    cubit = PlayerCubit();
  });
  group('PlayerCubit', () {
    final tPlayerName = 'Bruno';
    final tPlayer = Player(name: 'Bruno');
    test(
      'should return [] when getting initial state',
      () async {
        // assert
        expect(cubit?.state, equals([]));
      },
    );
    test(
      'should emit List<Player> when a new player is added',
      () async {
        // act
        cubit?.addPlayer(name: tPlayerName);
        // assert
        expect(cubit?.state, isA<List<Player>>());
      },
    );

    blocTest(
      'should contain player when the addPlayer method is called',
      build: () => PlayerCubit(),
      act: (PlayerCubit cubit) => cubit.addPlayer(name: tPlayerName),
      expect: () => [
        [tPlayer]
      ],
    );
    blocTest(
      'should remove a Player from state when removePlayer is called',
      build: () => PlayerCubit(),
      seed: () => [tPlayer],
      act: (PlayerCubit bloc) => bloc.removePlayer(name: tPlayer.name),
      expect: () => equals([[]]),
    );
  });
}
