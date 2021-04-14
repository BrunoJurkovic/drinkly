import 'package:dartz/dartz.dart';

import '../../../app/error/failures.dart';
import '../../../decks/domain/entities/drink_card.dart';
import '../../../players/domain/entities/player.dart';
import '../entities/card_text.dart';
import '../repositories/game_repository.dart';

class GetCardText {
  GetCardText({required this.repository});
  final GameRepository repository;

  Either<Failure, CardText> call(
      {required DrinkCard card, required List<Player> players}) {
    return repository.getCardText(card: card, players: players);
  }
}
