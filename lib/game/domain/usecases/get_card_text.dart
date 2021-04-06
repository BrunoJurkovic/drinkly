import 'package:dartz/dartz.dart';
import 'package:drinkly/app/error/failures.dart';
import 'package:drinkly/decks/domain/entities/drink_card.dart';
import 'package:drinkly/game/domain/entities/card_text.dart';
import 'package:drinkly/game/domain/repositories/game_repository.dart';
import 'package:drinkly/players/domain/entities/player.dart';

class GetCardText {
  GetCardText({required this.repository});
  final GameRepository repository;

  Either<Failure, CardText> call(
      {required DrinkCard card, required List<Player> players}) {
    return repository.getCardText(card: card, players: players);
  }
}
