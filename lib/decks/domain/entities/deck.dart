import 'package:equatable/equatable.dart';

import 'drink_card.dart';

enum DeckType {
  standard,
  mixed,
  unsupported,
}

class Deck extends Equatable {
  Deck({required this.name, required this.cards, required this.deckType});
  final String name;
  final List<DrinkCard> cards;
  final DeckType deckType;

  @override
  List<Object?> get props => [name, cards, deckType];
}
