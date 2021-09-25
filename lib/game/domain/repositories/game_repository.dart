// 📦 Package imports:
import 'package:dartz/dartz.dart';

// 🌎 Project imports:
import '../../../app/error/failures.dart';
import '../../../decks/domain/entities/drink_card.dart';
import '../../../players/domain/entities/player.dart';
import '../entities/card_text.dart';

abstract class GameRepository {
  Either<Failure, CardText> getCardText({
    required DrinkCard card,
    required List<Player> players,
  });
}
