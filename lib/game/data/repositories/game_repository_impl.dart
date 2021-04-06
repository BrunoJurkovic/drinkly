import 'dart:math';

import 'package:drinkly/game/domain/entities/card_text.dart';
import 'package:drinkly/decks/domain/entities/drink_card.dart';
import 'package:drinkly/app/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:drinkly/game/domain/repositories/game_repository.dart';
import 'package:drinkly/players/domain/entities/player.dart';

class GameRepositoryImpl implements GameRepository {
  @override
  Either<Failure, CardText> getCardText(
      {required DrinkCard card, required List<Player> players}) {
    if (players.length >= 2) {
      var player1 = players[Random().nextInt(players.length)].name;
      var player2 = players[Random().nextInt(players.length)].name;

      final text = card.text;
      while (player1 == player2) {
        player2 = players[Random().nextInt(players.length)].name;
      }

      var cardText = text
          .replaceAll(RegExp('player1'), player1)
          .replaceAll(RegExp('player2'), player2);

      final output = CardText(text: cardText);
      print('output is $output');
      return Right(output);
    }
    return Left(DeckFailure());
  }
}
