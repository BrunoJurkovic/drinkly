import 'package:drinkly/app/error/errors.dart';
import 'package:drinkly/decks/data/datasources/local_card_source.dart';
import 'package:drinkly/decks/domain/entities/deck.dart';
import 'package:drinkly/app/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:drinkly/decks/domain/repositories/deck_repository.dart';

class DeckRepositoryImpl implements DeckRepository {
  DeckRepositoryImpl({required this.cardSource});
  final LocalCardSource cardSource;

  @override
  Either<Failure, Deck> getDeckById(DeckType deckType) {
    try {
      final result = cardSource.getDeckById(deckType);
      return Right(result);
    } on DeckError {
      return Left(DeckFailure());
    }
  }
}
