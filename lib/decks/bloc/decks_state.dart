part of 'decks_bloc.dart';

abstract class DecksState extends Equatable {
  const DecksState();

  @override
  List<Object> get props => [];
}

class DecksInitial extends DecksState {}

class DecksData extends DecksState {
  DecksData({required this.decks});
  final List<Deck> decks;
}

/// This is used when we are fetching for a single
/// deck in the deck pack.
class SingleDeckData extends DecksState {
  SingleDeckData(this.deck);
  final Deck deck;
}
