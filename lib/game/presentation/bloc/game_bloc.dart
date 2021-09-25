// 🎯 Dart imports:
import 'dart:async';

// 📦 Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// 🌎 Project imports:
import '../../../app/error/errors.dart';
import '../../../decks/domain/entities/drink_card.dart';
import '../../../players/domain/entities/player.dart';
import '../../domain/usecases/get_card_text.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({required this.getCardText}) : super(GameInitial());

  final GetCardText getCardText;

  Stream<GameState> _mapGameInitialize(GameInitialize event) async* {
    final output = <String>[];

    for (final card in event.cards) {
      getCardText(players: event.players, card: card).fold(
        (l) => throw DeckError(),
        (r) => output.add(r.text),
      );
    }
    await Future<void>.delayed(Duration.zero);
    yield GameLoaded(output);
  }

  @override
  Stream<GameState> mapEventToState(
    GameEvent event,
  ) async* {
    if (event is GameInitialize) {
      await Future<void>.delayed(Duration.zero);
      yield GameInitial();
      await Future<void>.delayed(Duration.zero);
      yield* _mapGameInitialize(event);
    }
  }
}
