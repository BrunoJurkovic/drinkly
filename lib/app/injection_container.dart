import 'package:drinkly/decks/decks.dart';
import 'package:drinkly/game/bloc/game_bloc.dart';
import 'package:drinkly/game/data/repository/game_repository.dart';
import 'package:drinkly/players/cubit/player_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initGetIt() {
  sl.registerLazySingleton(() => PlayerCubit());
  sl.registerLazySingleton(() => DecksBloc());
  sl.registerLazySingleton(
    () => GameBloc(
      repository: sl<GameRepository>(),
      playerCubit: sl(),
    ),
  );
  sl.registerFactory(
    () => GameRepository(),
  );
}
