part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class GameInitialize extends GameEvent {
  GameInitialize({required this.players, required this.selectedDeck});
  final List<Player> players;
  final Deck selectedDeck;
}
