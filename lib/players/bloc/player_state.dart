part of 'player_bloc.dart';

@immutable
abstract class PlayerState {}

class PlayerInitial extends PlayerState {}

/// This is the state that returns
/// a list of players.
class PlayerLoaded extends PlayerState {}

class PlayerError extends PlayerState {}
