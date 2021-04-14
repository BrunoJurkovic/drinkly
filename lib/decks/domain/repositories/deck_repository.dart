import 'package:dartz/dartz.dart';

import '../../../app/error/failures.dart';
import '../entities/deck.dart';

abstract class DeckRepository {
  Either<Failure, Deck> getDeckById(DeckType deckType);
  Either<Failure, List<Deck>> getAllDecks();
}
