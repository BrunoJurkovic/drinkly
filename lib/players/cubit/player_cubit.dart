import 'package:bloc/bloc.dart';
import 'package:drinkly/players/models/player.dart';
import 'package:meta/meta.dart';

class PlayerCubit extends Cubit<List<Player>> {
  PlayerCubit() : super([]);

  void addPlayer({required String name}) {
    state.add(
      Player(name: name),
    );
    print(state);
  }

  void removePlayer({required String name}) {
    state.removeWhere((element) => element.name == name);
  }
}
