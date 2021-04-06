import 'package:dartz/dartz.dart';
import 'package:drinkly/app/error/failures.dart';
import 'package:drinkly/decks/domain/entities/deck.dart';
import 'package:drinkly/decks/domain/repositories/deck_repository.dart';

class GetAllDecks {
  GetAllDecks({required this.repository});
  final DeckRepository repository;

  Either<Failure, List<Deck>> call() {
    return repository.getAllDecks();
  }
}
