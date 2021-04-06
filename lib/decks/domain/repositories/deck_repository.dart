import 'package:dartz/dartz.dart';
import 'package:drinkly/app/error/failures.dart';
import 'package:drinkly/decks/domain/entities/deck.dart';

abstract class DeckRepository {
  Either<Failure, Deck> getDeckById(DeckType deckType);
  Either<Failure, List<Deck>> getAllDecks();
}
