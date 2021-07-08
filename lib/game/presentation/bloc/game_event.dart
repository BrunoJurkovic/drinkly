part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class GameInitialize extends GameEvent {
  const GameInitialize({required this.players, required this.cards});
  final List<Player> players;
  final List<DrinkCard> cards;
}
