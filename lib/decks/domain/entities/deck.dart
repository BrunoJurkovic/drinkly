// 🌎 Project imports:
import 'drink_card.dart';

enum DeckType {
  standard,
  mixed,
  unsupported,
}

class Deck {
  Deck({required this.name, required this.cards, required this.deckType});
  final String name;
  final List<DrinkCard> cards;
  final DeckType deckType;
}
