import 'package:drinkly/players/domain/entities/player.dart';
import 'package:drinkly/app/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:drinkly/players/domain/repositories/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  @override
  Either<Failure, Player> getPlayerFromName(String name) {
    if (name.trim().isEmpty) return Left(NameFailure());
    return Right(
      Player(name: name),
    );
  }
}
