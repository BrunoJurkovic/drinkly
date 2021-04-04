import 'package:bloc/bloc.dart';
import 'package:drinkly/app/error/errors.dart';
import 'package:drinkly/players/domain/entities/player.dart';
import 'package:drinkly/players/domain/usecases/add_player.dart';

class PlayerCubit extends Cubit<List<Player>> {
  PlayerCubit({required this.getPlayerFromName}) : super(<Player>[]);
  final GetPlayerFromName getPlayerFromName;

  void addPlayer(String name) {
    // ignore: unnecessary_cast
    var currentPlayers = List<Player>.from(state) as List<Player>;
    // Call our usecase to get a [Player] object when providing the name,
    // then return and add said Player to the state.
    getPlayerFromName(name).fold((failure) {
      throw NameError();
    }, (player) {
      currentPlayers.add(player);
      emit(currentPlayers);
    });
  }

  void removePlayer(String name) {
    // ignore: unnecessary_cast
    var currentPlayers = List<Player>.from(state) as List<Player>;
    // Call our usecase to get a [Player] object when providing the name,
    // then return and remove said Player from the state.
    getPlayerFromName(name).fold(
      (failure) {
        throw NameError();
      },
      (player) {
        currentPlayers.removeWhere((element) => element.name == player.name);
        emit(currentPlayers);
      },
    );
  }
}
