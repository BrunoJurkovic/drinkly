part of 'game_bloc.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameInitial extends GameState {}

class GameLoaded extends GameState {
  GameLoaded({required this.cards});
  final List<DrinkCard> cards;

  @override
  bool? get stringify => false;

  @override
  List<Object> get props => [cards];
}
