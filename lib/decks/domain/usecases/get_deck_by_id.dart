import 'package:dartz/dartz.dart';

import '../../../app/error/failures.dart';
import '../entities/deck.dart';
import '../repositories/deck_repository.dart';

class GetDeckById {
  GetDeckById({required this.repository});
  final DeckRepository repository;

  Either<Failure, Deck> call(DeckType deckType) {
    return repository.getDeckById(deckType);
  }
}
