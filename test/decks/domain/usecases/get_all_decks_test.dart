import 'package:dartz/dartz.dart';
import 'package:drinkly/decks/domain/entities/deck.dart';
import 'package:drinkly/decks/domain/entities/drink_card.dart';
import 'package:drinkly/decks/domain/repositories/deck_repository.dart';
import 'package:drinkly/decks/domain/usecases/get_all_decks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDeckRepository extends Mock implements DeckRepository {}

void main() {
  late MockDeckRepository repository;
  late GetAllDecks usecase;

  setUp(() {
    repository = MockDeckRepository();
    usecase = GetAllDecks(
      repository: repository,
    );
  });

  // final tDeckType = DeckType.standard;

  final tDeck = Deck(
    name: 'test',
    deckType: DeckType.standard,
    cards: [DrinkCard(type: CardType.regular, text: 'test')],
  );

  final tDeck2 = Deck(
    name: 'test2',
    deckType: DeckType.mixed,
    cards: [DrinkCard(type: CardType.rule, text: 'test2')],
  );

  final listOfDeck = [tDeck, tDeck2];

  test(
    'should get [List<Deck>] from repository',
    () async {
      // arrange
      when(() => repository.getAllDecks()).thenReturn(Right(listOfDeck));
      // act
      final result = usecase();
      // assert
      expect(
        result,
        equals(Right(listOfDeck)),
      );
    },
  );
}
