import 'package:dartz/dartz.dart';
import 'package:drinkly/decks/domain/entities/drink_card.dart';
import 'package:drinkly/game/domain/entities/card_text.dart';
import 'package:drinkly/game/domain/repositories/game_repository.dart';
import 'package:drinkly/game/domain/usecases/get_card_text.dart';
import 'package:drinkly/players/domain/entities/player.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGameRepository extends Mock implements GameRepository {}

void main() {
  late final MockGameRepository repository;
  late final GetCardText usecase;

  setUp(() {
    repository = MockGameRepository();
    usecase = GetCardText(repository: repository);
  });

  final players = [
    Player(name: 'test'),
    Player(name: 'test2'),
  ];

  final card = DrinkCard(type: CardType.regular, text: 'player1 must player2');

  final cardText = CardText(text: 'test must test2');

  test(
    'should get text from the repository',
    () async {
      // arrange
      when(() => repository.getCardText(card: card, players: players))
          .thenReturn(Right(cardText));
      // act
      final result = usecase(card: card, players: players);
      // assert
      expect(result, Right(cardText));
    },
  );
}
