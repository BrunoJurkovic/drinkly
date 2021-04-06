import 'package:dartz/dartz.dart';
import 'package:drinkly/app/error/failures.dart';
import 'package:drinkly/decks/domain/entities/deck.dart';
import 'package:drinkly/decks/domain/repositories/deck_repository.dart';

class GetDeckById {
  GetDeckById({required this.repository});
  final DeckRepository repository;

  Either<Failure, Deck> call(DeckType deckType) {
    return repository.getDeckById(deckType);
  }
}
