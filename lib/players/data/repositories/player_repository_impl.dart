// 📦 Package imports:
import 'package:dartz/dartz.dart';

// 🌎 Project imports:
import '../../../app/error/failures.dart';
import '../../domain/entities/player.dart';
import '../../domain/repositories/player_repository.dart';

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
