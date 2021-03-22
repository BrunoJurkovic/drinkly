part of 'decks_bloc.dart';

abstract class DecksState extends Equatable {
  const DecksState();
  
  @override
  List<Object> get props => [];
}

class DecksInitial extends DecksState {}
