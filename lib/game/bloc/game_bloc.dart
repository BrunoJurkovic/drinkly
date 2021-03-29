import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drinkly/decks/data/repository/deck_repository.dart';
import 'package:drinkly/decks/decks.dart';
import 'package:drinkly/decks/models/card.dart';
import 'package:drinkly/game/data/repository/game_repository.dart';
import 'package:drinkly/players/players.dart';
import 'package:equatable/equatable.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({required this.repository, required this.playerCubit})
      : super(GameInitial());
  final GameRepository repository;
  final PlayerCubit playerCubit;

  List<DrinkCard> _getCards(DeckType deckId, List<Player> players) {
    final allCards = DeckRepository.getDeckById(deckId).cards;
    final processedCards =
        DeckRepository.prepareCards(allCards, playerCubit.state)..shuffle();
    return processedCards..shuffle();
  }

  @override
  Stream<GameState> mapEventToState(
    GameEvent event,
  ) async* {
    if (event is GamePrepare) {
      yield GameLoaded(cards: _getCards(event.deck, playerCubit.state));
    } else if (event is GameReloaded) {
      yield GameLoaded(cards: _getCards(event.deck, playerCubit.state));
    }
  }
}
