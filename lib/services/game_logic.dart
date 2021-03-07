import 'package:drinkly/models/player.dart';
import 'package:flutter/material.dart';

class GameLogic with ChangeNotifier {
  final List<Player> _players = [];

  List<Player> get players {
    return _players;
  }

  void addPlayer(Player player) {
    _players.add(player);
    notifyListeners();
  }
}
