part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class GamePrepare extends GameEvent {
  GamePrepare({required this.deck, required this.players});
  final DeckType deck;
  final List<Player> players;

  @override
  List<Object> get props => [deck, players];
}

class GameReloaded extends GameEvent {
  GameReloaded({required this.deck});
  final DeckType deck;
  @override
  List<Object> get props => [deck, DateTime.now()];
}
