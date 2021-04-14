import 'package:dartz/dartz.dart';

import '../../../app/error/failures.dart';
import '../entities/player.dart';

// Our abstraction for easier testing.
abstract class PlayerRepository {
  Either<Failure, Player> getPlayerFromName(String name);
}
