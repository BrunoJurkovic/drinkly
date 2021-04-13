import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drinkly/app/error/errors.dart';
import 'package:drinkly/decks/domain/entities/drink_card.dart';
import 'package:drinkly/game/domain/usecases/get_card_text.dart';
import 'package:drinkly/players/domain/entities/player.dart';
import 'package:equatable/equatable.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({required this.getCardText}) : super(GameInitial());

  final GetCardText getCardText;

  Stream<GameState> _mapGameInitialize(GameInitialize event) async* {
    var output = <String>[];

    for (final card in event.cards) {
      getCardText(players: event.players, card: card).fold(
        (l) => throw DeckError(),
        (r) => output.add(r.text),
      );
    }

    yield GameLoaded(output);
  }

  @override
  Stream<GameState> mapEventToState(
    GameEvent event,
  ) async* {
    if (event is GameInitialize) {
      yield GameInitial();
      yield* _mapGameInitialize(event);
    }
  }
}
