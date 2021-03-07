import 'package:drinkly/models/deck.dart';
import 'package:drinkly/models/player.dart';
import 'package:flutter/material.dart';

class GameLogic with ChangeNotifier {
  final List<Player> _players = [];
  final List<Deck> _decks = [...Deck.decks];

  List<Player> get players {
    return _players;
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
