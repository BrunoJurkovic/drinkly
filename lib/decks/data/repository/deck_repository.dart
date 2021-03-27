import 'dart:math';

import 'package:drinkly/decks/data/cards/card_data.dart';
import 'package:drinkly/decks/models/card.dart';
import 'package:drinkly/players/players.dart';

import '../../decks.dart';

class DeckRepository {
  static List<DrinkCard> mixAndMatchCards({
    required List<DrinkCard> standards,
    required List<DrinkCard> challenges,
    required List<DrinkCard> competitions,
    required List<DrinkCard> rules,
  }) {
    var standardCards = standards..shuffle();
    standardCards = standardCards.sublist(0, 19);
    var challengeCards = challenges..shuffle();
    challengeCards = challengeCards.sublist(0, 2);
    var competitionCards = competitions..shuffle();
    competitionCards = competitionCards.sublist(0, 2);
    var ruleCards = rules..shuffle();
    ruleCards = ruleCards.sublist(0, 2);

    // ignore: omit_local_variable_types
    final List<DrinkCard> output = [];
    // ignore: cascade_invocations
    output
      ..addAll(standardCards)
      ..addAll(challengeCards)
      ..addAll(competitionCards)
      ..addAll(ruleCards)
      ..shuffle();
    return output;
  }

  static List<DrinkCard> standardNoMix(List<DrinkCard> cards) {
    var standards = cards..shuffle();
    standards = standards.sublist(0, 25);
    return cards;
  }

  static List<DrinkCard> mixedCards() => List.from(mixAndMatchCards(
      standards: CardData.standardDeckRegular,
      challenges: CardData.standardDeckChallenge,
      competitions: CardData.standardDeckCompetition,
      rules: CardData.standardDeckRules));

  static List<DrinkCard> standardCards() =>
      List.from(standardNoMix(CardData.standardDeckRegular));

  static Deck getDeckById(DeckType id) {
    final selectedDeck = decks.firstWhere((element) => element.id == id);
    return selectedDeck;
  }

  static List<DrinkCard> prepareCards(
      List<DrinkCard> cards, List<Player> players) {
    var player1 = players[Random().nextInt(players.length)].name;
    var player2 = players[Random().nextInt(players.length)].name;
    final List<DrinkCard> cardsWithNames = [];

    while (player1 == player2) {
      player2 = players[Random().nextInt(players.length)].name;
    }

    for (final card in cards) {
      var temp = card.text.replaceAll(RegExp('player1'), player1);
      temp = temp.replaceAll(RegExp('player2'), player2);
      cardsWithNames.add(DrinkCard(type: card.type, text: temp));
    }
    var output = cardsWithNames.sublist(0, 25)..shuffle();

    return output;
  }

  static List<Deck> decks = [
    Deck(
      name: 'Standard Cards',
      id: DeckType.standard,
      isOwned: true,
      cards: standardCards(),
    ),
    Deck(
      name: 'Challenges, Rules and Competitions',
      id: DeckType.mixed,
      isOwned: true,
      cards: mixedCards(),
    ),
  ];
}
