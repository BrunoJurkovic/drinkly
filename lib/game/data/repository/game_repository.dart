import 'dart:math';

import 'package:drinkly/decks/models/card.dart';
import 'package:drinkly/players/models/player.dart';

class GameRepository {
  DrinkCard returnText({
    required DrinkCard card,
    required List<Player> players,
  }) {
    var player1 = players[Random().nextInt(players.length)].name;
    var player2 = players[Random().nextInt(players.length)].name;
    while (player1 == player2) {
      player2 = players[Random().nextInt(players.length)].name;
    }
    var temp = card.text.replaceAll(RegExp('player1'), player1);
    temp = temp.replaceAll(RegExp('player2'), player2);
    return DrinkCard(type: card.type, text: temp);
  }
}
