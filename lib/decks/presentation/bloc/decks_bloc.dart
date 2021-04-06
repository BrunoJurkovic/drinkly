import 'dart:async';

import 'package:bloc/bloc.dart';
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

  @override
  Stream<DecksState> mapEventToState(
    DecksEvent event,
  ) async* {
    if (event is GetDecks) {}
  }
}
