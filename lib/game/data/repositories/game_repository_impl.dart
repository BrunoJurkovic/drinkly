// 🎯 Dart imports:
import 'dart:math';

// 📦 Package imports:
import 'package:dartz/dartz.dart';

// 🌎 Project imports:
import '../../../app/error/failures.dart';
import '../../../decks/domain/entities/drink_card.dart';
import '../../../players/domain/entities/player.dart';
import '../../domain/entities/card_text.dart';
import '../../domain/repositories/game_repository.dart';

class GameRepositoryImpl implements GameRepository {
  @override
  Either<Failure, CardText> getCardText(
      {required DrinkCard card, required List<Player> players}) {
    if (players.length >= 2) {
      final player1 = players[Random().nextInt(players.length)].name;
      var player2 = players[Random().nextInt(players.length)].name;

      final text = card.text;
      while (player1 == player2) {
        player2 = players[Random().nextInt(players.length)].name;
      }

      final cardText = text
          .replaceAll(RegExp('player1'), player1)
          .replaceAll(RegExp('player2'), player2);

      final output = CardText(text: cardText);
      return Right(output);
    }
    return Left(DeckFailure());
  }
}
