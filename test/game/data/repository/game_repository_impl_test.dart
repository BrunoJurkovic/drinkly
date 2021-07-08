import 'package:drinkly/app/error/failures.dart';
import 'package:drinkly/decks/domain/entities/drink_card.dart';

import 'package:drinkly/game/data/repositories/game_repository_impl.dart';
import 'package:drinkly/game/domain/entities/card_text.dart';
import 'package:drinkly/game/domain/repositories/game_repository.dart';
import 'package:drinkly/players/domain/entities/player.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final GameRepository repo;

  setUpAll(() {
    repo = GameRepositoryImpl();
  });

  const players = [
    Player(name: 'test'),
    Player(name: 'test2'),
  ];

  const card = DrinkCard(type: CardType.regular, text: 'player1 must player2');

  test(
    'should return [CardText] object',
    () async {
      // act
      late CardText result;
      repo
          .getCardText(card: card, players: players)
          .fold((l) => null, (r) => result = r);
      // assert
      expect(result, isA<CardText>());
    },
  );

  test(
    'should contain both player1 and player2 name',
    () async {
      // act
      final result = repo.getCardText(card: card, players: players);
      late String text;
      result.fold((l) => null, (r) => text = r.text);
      // assert
      expect(text, contains('test'));
      expect(text, contains('test2'));
    },
  );

  test(
    'should reselect player2 if it is equal to player1',
    () async {
      const duplicatePlayers = [
        Player(name: 'name'),
        Player(name: 'name'),
        Player(name: 'name'),
        Player(name: 'name'),
        Player(name: 'name'),
        Player(name: 'name'),
        Player(name: 'name'),
        Player(name: 'name'),
        Player(name: 'name'),
        Player(name: 'name'),
        Player(name: 'name'),
        Player(name: 'name'),
        Player(name: 'name'),
        Player(name: 'name'),
        Player(name: 'name1'),
      ];
      // act
      final result = repo.getCardText(card: card, players: duplicatePlayers);
      late String text;
      result.fold((l) => null, (r) => text = r.text);
      // assert
      expect(text, contains('name'));
    },
  );

  test(
    'should return [DeckFailure] when there are zero players',
    () async {
      // act
      late Failure result;
      repo.getCardText(card: card, players: []).fold(
        (l) => result = l,
        (r) => null,
      );
      // assert
      expect(result, isA<DeckFailure>());
    },
  );

  test(
    'should return [DeckFailure] when there are less than 2 players',
    () async {
      // act
      late Failure result;
      repo.getCardText(card: card, players: const [Player(name: '')]).fold(
        (l) => result = l,
        (r) => null,
      );
      // assert
      expect(result, isA<DeckFailure>());
    },
  );
}
