// 📦 Package imports:
import 'package:dartz/dartz.dart';

// 🌎 Project imports:
import '../../../app/error/failures.dart';
import '../entities/deck.dart';
import '../repositories/deck_repository.dart';

class GetAllDecks {
  GetAllDecks({required this.repository});
  final DeckRepository repository;

  Either<Failure, List<Deck>> call() {
    return repository.getAllDecks();
  }
}
