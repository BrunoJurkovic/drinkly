import 'package:dartz/dartz.dart';
import 'package:drinkly/app/error/failures.dart';
import 'package:drinkly/players/domain/entities/player.dart';
import 'package:drinkly/players/domain/repositories/player_repository.dart';

class GetPlayerFromName {
  GetPlayerFromName({required this.repository});
  final PlayerRepository repository;

  // When this is called, return a [Either] with the
  // player object.
  Either<Failure, Player> call(String name) {
    return repository.getPlayerFromName(name);
  }
}
