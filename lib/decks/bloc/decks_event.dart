part of 'decks_bloc.dart';

abstract class DecksEvent extends Equatable {
  const DecksEvent();

  @override
  List<Object> get props => [];
}

class GetDecks extends DecksEvent {}

class GetDeckById extends DecksEvent {
  GetDeckById({required this.id});
  final DeckType id;
}
