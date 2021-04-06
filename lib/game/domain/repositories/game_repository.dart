import 'package:dartz/dartz.dart';
import 'package:drinkly/app/error/failures.dart';
import 'package:drinkly/decks/domain/entities/drink_card.dart';
import 'package:drinkly/game/domain/entities/card_text.dart';
import 'package:drinkly/players/domain/entities/player.dart';

abstract class GameRepository {
  Either<Failure, CardText> getCardText({
    required DrinkCard card,
    required List<Player> players,
  });
}
