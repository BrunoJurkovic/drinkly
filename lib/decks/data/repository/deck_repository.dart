import 'package:drinkly/decks/data/cards/card_data.dart';
import 'package:drinkly/decks/models/card.dart';

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

    var output = [];
    // ignore: cascade_invocations
    output
      ..addAll(standardCards)
      ..addAll(challengeCards)
      ..addAll(competitionCards)
      ..addAll(ruleCards)
      ..shuffle();
    return output as List<DrinkCard>;
  }

  static List<DrinkCard> standardNoMix(List<DrinkCard> cards) {
    var standards = cards..shuffle();
    standards = standards.sublist(0, 25);
    return cards;
  }

  static List<DrinkCard> mixedCards = List.from(mixAndMatchCards(
      standards: CardData.standardDeckRegular,
      challenges: CardData.standardDeckChallenge,
      competitions: CardData.standardDeckCompetition,
      rules: CardData.standardDeckRules));

  static List<DrinkCard> standardCards =
      List.from(standardNoMix(CardData.standardDeckRegular));

  static Deck getDeckById(DeckType id) {
    return decks.firstWhere((element) => element.id == id);
  }

  static List<Deck> decks = [
    Deck(
      name: 'Standard Cards',
      id: DeckType.standard,
      isOwned: true,
      cards: standardCards,
    ),
    Deck(
      name: 'Challenges, Rules and Competitions',
      id: DeckType.mixed,
      isOwned: true,
      cards: standardCards,
    ),
  ];
}
