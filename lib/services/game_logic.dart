import 'dart:math';

import 'package:drinkly/models/card.dart';
import 'package:drinkly/models/deck.dart';
import 'package:drinkly/models/player.dart';
import 'package:flutter/material.dart';

class GameLogic with ChangeNotifier {
  final List<Player> _players = [];
  final List<Deck> _decks = [...Deck.decks];

  List<Player> get players {
    return _players;
  }

  List<DrinkCard> processCards(List<DrinkCard> cards) {
    List<DrinkCard> output = cards;
    Random random = Random();
    output.shuffle();
    for (int i = 0; i <= output.length - 1; i++) {
      if (output[i].type == CardType.rule) {
        if ((output.length - i) >= 7) {
          output.insert(
            i + (random.nextInt(3) + 2),
            DrinkCard(
              text: 'The rule "${output[i].text}" is over.',
              type: CardType.regular,
            ),
          );
        }
      }
    }
    return output;
  }

  DrinkCard returnText(DrinkCard card) {
    int random = Random().nextInt(_players.length);
    DrinkCard output = card;
    if (_players.length > 1) {
      String player1 = _players[Random().nextInt(_players.length)].name;
      String player2 = _players[Random().nextInt(_players.length)].name;

      while (player1 == player2) {
        player1 = _players[Random().nextInt(_players.length)].name;
        player2 = _players[Random().nextInt(_players.length)].name;
      }
      String temp = card.text.replaceFirst(RegExp('player1'), player1);
      temp = temp.replaceFirst(RegExp('player2'), player2);
      output = DrinkCard(text: temp, type: card.type);
      return output;
    }
    String player1 = _players[Random().nextInt(_players.length)].name;
    String player2 = _players[Random().nextInt(_players.length)].name;
    String temp = card.text.replaceFirst(RegExp('player1'), player1);
    temp = card.text.replaceFirst(RegExp('player2'), player2);
    output = DrinkCard(text: temp, type: card.type);
    return output;
  }

  Deck getSelectedDeck(String id) {
    return _decks.firstWhere((deck) => deck.id == id);
  }

  void removePlayer(Player player) {
    _players.remove(player);
    notifyListeners();
  }

  void addPlayer(Player player) {
    _players.add(player);
    notifyListeners();
  }
}
