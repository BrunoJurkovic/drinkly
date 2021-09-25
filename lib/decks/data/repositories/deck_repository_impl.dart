// 📦 Package imports:
import 'package:dartz/dartz.dart';

// 🌎 Project imports:
import '../../../app/error/errors.dart';
import '../../../app/error/failures.dart';
import '../../domain/entities/deck.dart';
import '../../domain/repositories/deck_repository.dart';
import '../datasources/local_card_source.dart';

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

  @override
  Either<Failure, List<Deck>> getAllDecks() {
    try {
      final result = cardSource.getAllDecks();
      return Right(result);
    } on DeckError {
      return Left(DeckFailure());
    }
  }
}
