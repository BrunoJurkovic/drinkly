import 'package:drinkly/players/data/repositories/player_repository_impl.dart';
import 'package:drinkly/players/domain/repositories/player_repository.dart';
import 'package:drinkly/players/domain/usecases/add_player.dart';
import 'package:drinkly/players/presentation/cubit/player_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

// ignore_for_file: cascade_invocations

void initDependencies() {
  sl.registerSingleton(
    () => PlayerCubit(
      getPlayerFromName: sl(),
    ),
  );

  sl.registerSingleton(
    () => GetPlayerFromName(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton<PlayerRepository>(
    () => PlayerRepositoryImpl(),
  );
}
