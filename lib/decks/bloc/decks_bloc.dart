import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drinkly/decks/data/repository/deck_repository.dart';
import 'package:drinkly/decks/decks.dart';
import 'package:equatable/equatable.dart';

part 'decks_event.dart';
part 'decks_state.dart';

class DecksBloc extends Bloc<DecksEvent, DecksState> {
  DecksBloc() : super(DecksInitial());

  @override
  Stream<DecksState> mapEventToState(
    DecksEvent event,
  ) async* {
    if (event is GetDecks) {
      final decks = DeckRepository.decks;
      yield DecksData(decks: decks);
    } else if (event is GetDeckById) {
      final deck = DeckRepository.getDeckById(event.id);
      yield SingleDeckData(deck);
    }
  }
}
