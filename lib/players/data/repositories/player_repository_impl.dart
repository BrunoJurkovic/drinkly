import 'package:drinkly/players/domain/entities/player.dart';
import 'package:drinkly/app/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:drinkly/players/domain/repositories/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  @override
  Either<Failure, Player> getPlayerFromName(String name) {
    // If the name of the player is empty ('', '   ', etc.), return a failure.
    if (name.trim().isEmpty) return Left(NameFailure());
    // else, return a [Player] object.
    return Right(
      Player(name: name),
    );
  }
}
