part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class GamePrepare extends GameEvent {
  GamePrepare({required this.deck});
  final DeckType deck;

  @override
  List<Object> get props => [deck];
}

class GameReloaded extends GameEvent {
  @override
  List<Object> get props => [];
}
