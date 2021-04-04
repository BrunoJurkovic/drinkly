import 'package:drinkly/players/domain/entities/player.dart';
import 'package:drinkly/app/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:drinkly/players/domain/repositories/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  @override
  Either<Failure, Player> getPlayerFromName(String name) {
    print(name.isEmpty);

    return Right(
      Player(name: name),
    );
  }
}
