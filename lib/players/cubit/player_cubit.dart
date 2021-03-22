import 'package:bloc/bloc.dart';
import 'package:drinkly/players/models/player.dart';

class PlayerCubit extends Cubit<List<Player>> {
  PlayerCubit() : super([]);

  void addPlayer({required String name}) {
    emit(List.of(state)..add(Player(name: name)));
  }

  void removePlayer({required String name}) {
    emit(List.of(state)..removeWhere((element) => element.name == name));
  }
}
