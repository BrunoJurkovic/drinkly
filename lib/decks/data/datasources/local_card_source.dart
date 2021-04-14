import '../../../app/error/errors.dart';
import '../../domain/entities/deck.dart';
import 'cards/all_cards.dart';

abstract class LocalCardSource {
  Deck getDeckById(DeckType deckType);
  List<Deck> getAllDecks();
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

  @override
  List<Deck> getAllDecks() {
    final result = [getStandardDeck(), getMixedDeck()];
    return result;
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
