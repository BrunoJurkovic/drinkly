import 'package:dartz/dartz.dart';
import 'package:drinkly/app/error/failures.dart';
import 'package:drinkly/players/domain/entities/player.dart';

abstract class PlayerRepository {
  Either<Failure, Player> getPlayerFromName(String name);
}
