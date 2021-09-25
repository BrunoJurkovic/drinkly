// 📦 Package imports:
import 'package:bloc/bloc.dart';

// 🌎 Project imports:
import '../../../app/error/errors.dart';
import '../../domain/entities/player.dart';
import '../../domain/usecases/get_player_from_name.dart';

class PlayerCubit extends Cubit<List<Player>> {
  PlayerCubit({required this.getPlayerFromName}) : super(<Player>[]);
  final GetPlayerFromName getPlayerFromName;

  void addPlayer(String name) {
    // ignore: unnecessary_cast
    final currentPlayers = List<Player>.from(state) as List<Player>;
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
    final currentPlayers = List<Player>.from(state) as List<Player>;
    // Call our usecase to get a [Player] object when providing the name,
    // then return and remove said Player from the state.
    getPlayerFromName(name).fold(
      (failure) {
        // If it returns a [Failure], then throw an error.
        throw NameError();
      },
      (player) {
        currentPlayers.removeWhere((element) => element.name == player.name);
        emit(currentPlayers);
      },
    );
  }
}
