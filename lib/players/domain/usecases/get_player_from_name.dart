import 'package:dartz/dartz.dart';

import '../../../app/error/failures.dart';
import '../entities/player.dart';
import '../repositories/player_repository.dart';

class GetPlayerFromName {
  GetPlayerFromName({required this.repository});
  final PlayerRepository repository;

  // When this is called, return a [Either] with the
  // player object.
  Either<Failure, Player> call(String name) {
    return repository.getPlayerFromName(name);
  }
}
