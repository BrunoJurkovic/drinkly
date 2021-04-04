import 'package:bloc/bloc.dart';
import 'package:drinkly/players/domain/entities/player.dart';
import 'package:drinkly/players/domain/usecases/add_player.dart';

class PlayerCubit extends Cubit<List<Player>> {
  PlayerCubit({required this.getPlayerFromName}) : super(<Player>[]);
  final GetPlayerFromName getPlayerFromName;

  void addPlayer(String name) {
    // ignore: unnecessary_cast
    var currentPlayers = List<Player>.from(state) as List<Player>;
    getPlayerFromName(name).fold((failure) {}, (player) {
      currentPlayers.add(player);
      emit(currentPlayers);
    });
  }

  void removePlayer(String name) {
    // ignore: unnecessary_cast
    var currentPlayers = List<Player>.from(state) as List<Player>;
    getPlayerFromName(name).fold((failure) {}, (player) {
      currentPlayers.removeWhere((element) => element.name == player.name);
      emit(currentPlayers);
    });
  }
}
