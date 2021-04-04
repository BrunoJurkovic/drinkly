import 'package:bloc_test/bloc_test.dart';
import 'package:drinkly/players/data/repositories/player_repository_impl.dart';
import 'package:drinkly/players/domain/entities/player.dart';
import 'package:drinkly/players/domain/usecases/add_player.dart';
import 'package:drinkly/players/presentation/cubit/player_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tPlayer = Player(name: 'test');

  late GetPlayerFromName usecase;
  late PlayerRepositoryImpl repo;

  setUp(() {
    repo = PlayerRepositoryImpl();
    usecase = GetPlayerFromName(repository: repo);
  });

  blocTest(
    'should start with an empty list of players.',
    build: () => PlayerCubit(getPlayerFromName: usecase),
    expect: () => <Player>[],
  );
  blocTest(
    'should add player to the state when [addPlayer] is called',
    build: () => PlayerCubit(getPlayerFromName: usecase),
    act: (PlayerCubit cubit) => cubit.addPlayer(tPlayer.name),
    expect: () => hasLength(1),
  );
}
