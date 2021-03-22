import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'decks_event.dart';
part 'decks_state.dart';

class DecksBloc extends Bloc<DecksEvent, DecksState> {
  DecksBloc() : super(DecksInitial());

  @override
  Stream<DecksState> mapEventToState(
    DecksEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
