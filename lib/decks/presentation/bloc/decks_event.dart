part of 'decks_bloc.dart';

abstract class DecksEvent {
  const DecksEvent();
}

class DecksGet extends DecksEvent {}

class DeckGetById extends DecksEvent {
  DeckGetById({required this.deckType});
  final DeckType deckType;
}
