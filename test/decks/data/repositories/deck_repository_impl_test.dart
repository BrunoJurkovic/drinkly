import 'package:dartz/dartz.dart';
import 'package:drinkly/decks/data/datasources/local_card_source.dart';
import 'package:drinkly/decks/data/repositories/deck_repository_impl.dart';
import 'package:drinkly/decks/domain/entities/deck.dart';
import 'package:drinkly/decks/domain/entities/drink_card.dart';
import 'package:drinkly/decks/domain/repositories/deck_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocalCardSource extends Mock implements LocalCardSource {}

void main() {
  late DeckRepository repo;
  late LocalCardSource cardSource;

  setUp(() {
    cardSource = MockLocalCardSource();
    repo = DeckRepositoryImpl(cardSource: cardSource);
  });

  final tDeckType = DeckType.standard;

  final tDeck = Deck(
    name: 'test',
    deckType: DeckType.standard,
    cards: [DrinkCard(type: CardType.regular, text: 'test')],
  );

  test(
    'should return [Deck] when called with DeckType',
    () async {
      // arrange
      when(() => cardSource.getDeckById(tDeckType)).thenReturn(tDeck);
      // act
      final result = repo.getDeckById(tDeckType);
      // assert
      expect(result, Right(tDeck));
    },
  );
}