import 'package:bloc_test/bloc_test.dart';
import 'package:drinkly/players/cubit/player_cubit.dart';
import 'package:drinkly/players/models/player.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  PlayerCubit? cubit;

  setUp(() {
    cubit = PlayerCubit();
  });
  group('PlayerCubit', () {
    final tPlayerName = 'Bob';
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
    test(
      'should return empty list when adding and then removing a player.',
      () async {
        // arrange
        cubit?.addPlayer(name: tPlayerName);
        // act
        cubit?.removePlayer(name: tPlayerName);
        // assert
        expect(cubit?.state, equals([]));
      },
    );
  });
}
