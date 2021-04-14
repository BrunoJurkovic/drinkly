part of 'decks_bloc.dart';

abstract class DecksState extends Equatable {
  const DecksState();

  @override
  List<Object> get props => [];
}

class DecksInitial extends DecksState {}

class DecksLoaded extends DecksState {
  DecksLoaded({required this.decks});
  final List<Deck> decks;
}

class SingleDeckLoaded extends DecksState {
  SingleDeckLoaded({required this.deck});
  final Deck deck;
}
