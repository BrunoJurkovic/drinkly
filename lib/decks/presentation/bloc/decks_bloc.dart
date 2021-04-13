import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drinkly/app/error/errors.dart';
import 'package:drinkly/decks/domain/entities/deck.dart';
import 'package:drinkly/decks/domain/usecases/get_all_decks.dart';
import 'package:drinkly/decks/domain/usecases/get_deck_by_id.dart';
import 'package:equatable/equatable.dart';

part 'decks_event.dart';
part 'decks_state.dart';

class DecksBloc extends Bloc<DecksEvent, DecksState> {
  DecksBloc({
    required this.getDeckById,
    required this.getAllDecks,
  }) : super(DecksInitial());

  final GetDeckById getDeckById;
  final GetAllDecks getAllDecks;

  Stream<DecksState> _mapGetDecks() async* {
    yield* getAllDecks().fold(
      (l) => throw DeckError(),
      (decks) async* {
        yield DecksLoaded(decks: decks);
      },
    );
  }

  Stream<DecksState> _mapGetDeckById(DeckType deckType) async* {
    yield* getDeckById(deckType).fold(
      (l) => throw DeckError(),
      (deck) async* {
        yield SingleDeckLoaded(deck: deck);
      },
    );
  }

  @override
  Stream<DecksState> mapEventToState(
    DecksEvent event,
  ) async* {
    if (event is DecksGet) {
      yield DecksInitial();
      yield* _mapGetDecks();
    } else if (event is DeckGetById) {
      yield DecksInitial();
      yield* _mapGetDeckById(event.deckType);
    }
  }
}
