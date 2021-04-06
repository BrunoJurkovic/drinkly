import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:drinkly/app/error/errors.dart';
import 'package:drinkly/app/error/failures.dart';
import 'package:drinkly/decks/data/datasources/cards/all_cards.dart';
import 'package:drinkly/decks/data/datasources/local_card_source.dart';
import 'package:drinkly/decks/data/repositories/deck_repository_impl.dart';
import 'package:drinkly/decks/domain/entities/deck.dart';

import 'package:drinkly/decks/domain/repositories/deck_repository.dart';
import 'package:drinkly/decks/domain/usecases/get_all_decks.dart';
import 'package:drinkly/decks/domain/usecases/get_deck_by_id.dart';
import 'package:drinkly/decks/presentation/bloc/decks_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllDecks extends Mock implements GetAllDecks {}

void main() {
  late GetDeckById getDeckById;
  late GetAllDecks getAllDecks;
  late DeckRepository repository;
  late LocalCardSource cardSource;
  late AllCards allCards;
  late GetAllDecks mockGetAllDecks;

  setUp(() {
    allCards = AllCards();
    cardSource = LocalCardSourceImpl(allCards: allCards);
    repository = DeckRepositoryImpl(
      cardSource: cardSource,
    );
    getDeckById = GetDeckById(repository: repository);
    getAllDecks = GetAllDecks(repository: repository);
    mockGetAllDecks = MockGetAllDecks();
    // bloc = DecksBloc(
    //   getAllDecks: getAllDecks,
    //   getDeckById: getDeckById,
    // );
  });

  group('GetDecks', () {
    blocTest(
      'should emit an initial state of [DecksInitial]',
      build: () => DecksBloc(
        getAllDecks: getAllDecks,
        getDeckById: getDeckById,
      ),
      expect: () => [],
    );
    blocTest(
      'should emit [DecksLoaded] when [GetDecks] is called.',
      build: () => DecksBloc(
        getAllDecks: getAllDecks,
        getDeckById: getDeckById,
      ),
      act: (DecksBloc bloc) => bloc.add(DecksGet()),
      expect: () => [isA<DecksLoaded>()],
    );

    blocTest(
      'should throw [DeckError] when a error occurs.',
      build: () => DecksBloc(
        getAllDecks: mockGetAllDecks,
        getDeckById: getDeckById,
      ),
      act: (DecksBloc bloc) {
        when(() => mockGetAllDecks())
            .thenAnswer((invocation) => Left(DeckFailure()));
        bloc.add(
          DecksGet(),
        );
      },
      errors: () => [isA<DeckError>()],
    );
  });

  group('GetDeckById', () {
    blocTest(
      'should emit an initial state of [DecksInitial]',
      build: () => DecksBloc(
        getAllDecks: getAllDecks,
        getDeckById: getDeckById,
      ),
      expect: () => [],
    );
    blocTest(
      'should emit [DecksLoaded] when [GetDeckById] is called.',
      build: () => DecksBloc(
        getAllDecks: getAllDecks,
        getDeckById: getDeckById,
      ),
      act: (DecksBloc bloc) => bloc.add(
        DeckGetById(
          deckType: DeckType.standard,
        ),
      ),
      expect: () => [isA<SingleDeckLoaded>()],
    );
    blocTest(
      'should throw [DeckError] when invalid params are provided.',
      build: () => DecksBloc(
        getAllDecks: getAllDecks,
        getDeckById: getDeckById,
      ),
      act: (DecksBloc bloc) => bloc.add(
        DeckGetById(
          deckType: DeckType.unsupported,
        ),
      ),
      errors: () => [isA<DeckError>()],
    );
  });
}
