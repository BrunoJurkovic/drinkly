part of 'game_bloc.dart';

abstract class GameState extends Equatable {
  const GameState();
  
  @override
  List<Object> get props => [];
}

class GameInitial extends GameState {}
