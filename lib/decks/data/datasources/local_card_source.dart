import 'package:drinkly/app/error/errors.dart';
import 'package:drinkly/decks/data/datasources/cards/all_cards.dart';
import 'package:drinkly/decks/domain/entities/deck.dart';

abstract class LocalCardSource {
  Deck getDeckById(DeckType deckType);
}

class LocalCardSourceImpl implements LocalCardSource {
  LocalCardSourceImpl({required this.allCards});
  final AllCards allCards;
  @override
  Deck getDeckById(DeckType deckType) {
    if (deckType == DeckType.standard)
      return getStandardDeck();
    else if (deckType == DeckType.mixed) return getMixedDeck();
    throw DeckError();
  }

  Deck getStandardDeck() {
    final output = allCards.getStandardCards();
    return Deck(cards: output, deckType: DeckType.standard, name: 'Standard');
  }

  Deck getMixedDeck() {
    final output = allCards.getMixedCards();
    return Deck(cards: output, deckType: DeckType.mixed, name: 'Mixed');
  }
}
