import 'package:drinkly/app/error/errors.dart';
import 'package:drinkly/decks/data/datasources/cards/all_cards.dart';
import 'package:drinkly/decks/data/datasources/local_card_source.dart';
import 'package:drinkly/decks/domain/entities/deck.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LocalCardSource cardSource;
  late AllCards allCards;

  setUp(() {
    allCards = AllCards();
    cardSource = LocalCardSourceImpl(allCards: allCards);
  });

  test(
    'should throw [DeckError] when wrong DeckType is provided',
    () async {
      // assert
      expect(
        () => cardSource.getDeckById(DeckType.unsupported),
        throwsA(
          isA<DeckError>(),
        ),
      );
    },
  );

  group('standard deck', () {
    test(
      'should return a [Deck] object',
      () async {
        // act
        final result = cardSource.getDeckById(DeckType.standard);
        // assert
        expect(result, isA<Deck>());
      },
    );
    test(
      'should return deck with [DeckType.standard]',
      () async {
        // act
        final result = cardSource.getDeckById(DeckType.standard).deckType;
        // assert
        expect(result, DeckType.standard);
      },
    );
    test(
      'should return 25 cards',
      () async {
        // act
        final result = cardSource.getDeckById(DeckType.standard).cards;
        // assert
        expect(result.length, 25);
      },
    );
    test(
      'should get random 25 cards each call',
      () async {
        // act
        final output1 = cardSource.getDeckById(DeckType.standard).cards;
        final output2 = cardSource.getDeckById(DeckType.standard).cards;
        // assert
        expect(output1, isNot(output2));
      },
    );
  });

  group('mixed deck', () {
    test(
      'should return a [Deck] object',
      () async {
        // act
        final result = cardSource.getDeckById(DeckType.mixed);
        // assert
        expect(result, isA<Deck>());
      },
    );
    test(
      'should return deck with [DeckType.mixed]',
      () async {
        // act
        final result = cardSource.getDeckById(DeckType.mixed).deckType;
        // assert
        expect(result, DeckType.mixed);
      },
    );
    test(
      'should return 25 cards',
      () async {
        // act
        final result = cardSource.getDeckById(DeckType.mixed).cards;
        // assert
        expect(result.length, 25);
      },
    );
    test(
      'should get random 25 cards each call',
      () async {
        // act
        final output1 = cardSource.getDeckById(DeckType.mixed).cards;
        final output2 = cardSource.getDeckById(DeckType.mixed).cards;
        // assert
        expect(output1, isNot(output2));
      },
    );
  });
}
