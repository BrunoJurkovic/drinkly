import 'package:dartz/dartz.dart';
import 'package:drinkly/decks/domain/entities/deck.dart';
import 'package:drinkly/decks/domain/entities/drink_card.dart';
import 'package:drinkly/decks/domain/repositories/deck_repository.dart';
import 'package:drinkly/decks/domain/usecases/get_deck_by_id.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDeckRepository extends Mock implements DeckRepository {}

void main() {
  late MockDeckRepository repository;
  late GetDeckById usecase;

  setUp(() {
    repository = MockDeckRepository();
    usecase = GetDeckById(
      repository: repository,
    );
  });

  final tDeckType = DeckType.standard;

  final tDeck = Deck(
    name: 'test',
    deckType: DeckType.standard,
    cards: [DrinkCard(type: CardType.regular, text: 'test')],
  );

  test(
    'should get deck from repository with id',
    () async {
      // arrange
      when(() => repository.getDeckById(tDeckType)).thenReturn(Right(tDeck));
      // act
      final result = usecase(tDeckType);
      // assert
      expect(result, Right(tDeck));
    },
  );
}
