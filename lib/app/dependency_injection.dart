import 'package:get_it/get_it.dart';

import '../decks/data/datasources/cards/all_cards.dart';
import '../decks/data/datasources/local_card_source.dart';
import '../decks/data/repositories/deck_repository_impl.dart';
import '../decks/domain/repositories/deck_repository.dart';
import '../decks/domain/usecases/get_all_decks.dart';
import '../decks/domain/usecases/get_deck_by_id.dart';
import '../decks/presentation/bloc/decks_bloc.dart';
import '../game/data/repositories/game_repository_impl.dart';
import '../game/domain/repositories/game_repository.dart';
import '../game/domain/usecases/get_card_text.dart';
import '../game/presentation/bloc/game_bloc.dart';
import '../players/data/repositories/player_repository_impl.dart';
import '../players/domain/repositories/player_repository.dart';
import '../players/domain/usecases/get_player_from_name.dart';
import '../players/presentation/cubit/player_cubit.dart';

final sl = GetIt.instance;

// ignore_for_file: cascade_invocations

void initDependencies() {
  _initPlayers();

  _initDecks();

  _initGame();
}

void _initPlayers() {
  sl.registerLazySingleton(
    () => PlayerCubit(
      getPlayerFromName: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetPlayerFromName(
      repository: sl(),
    ),
  );

  sl.registerSingleton<PlayerRepository>(
    PlayerRepositoryImpl(),
  );
}

void _initDecks() {
  sl.registerFactory(() => DecksBloc(getDeckById: sl(), getAllDecks: sl()));

  sl.registerLazySingleton(() => GetDeckById(repository: sl()));
  sl.registerLazySingleton(() => GetAllDecks(repository: sl()));

  sl.registerLazySingleton<DeckRepository>(
      () => DeckRepositoryImpl(cardSource: sl()));

  sl.registerLazySingleton<LocalCardSource>(
      () => LocalCardSourceImpl(allCards: sl()));

  sl.registerLazySingleton(() => AllCards());
}

void _initGame() {
  sl.registerFactory(() => GameBloc(getCardText: sl()));

  sl.registerLazySingleton(() => GetCardText(repository: sl()));
  sl.registerLazySingleton<GameRepository>(() => GameRepositoryImpl());
}
