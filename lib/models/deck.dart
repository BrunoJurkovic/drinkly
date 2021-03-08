import 'package:drinkly/models/card.dart';

class Deck {
  final String name;
  final String id;
  final List<DrinkCard> cards;
  final bool isOwned;

  Deck({this.name, this.id, this.cards, this.isOwned});

  static List<Deck> decks = [
    Deck(
      name: "Let's get the party started!",
      id: 'standard',
      isOwned: true,
      cards: [
        DrinkCard(
          text: "All guys say cheers and take a sip.",
          type: CardType.regular,
        ),
        DrinkCard(
          text: "player1 is unlucky and has to finish his drink.",
          type: CardType.regular,
        ),
        DrinkCard(
            text:
                "The last person who has looked at their phone has to take 3 sips.",
            type: CardType.regular),
        DrinkCard(
          text:
              "player1, can give another player as many sips as player2 has good personality traits.",
          type: CardType.regular,
        ),
        DrinkCard(
          text: "The last person to stand up has to finish their drink.",
          type: CardType.competition,
        ),
        DrinkCard(
          text:
              "The person who has a glowing keyboard takes 3 sips and should finally taste the touch of a woman.",
          type: CardType.regular,
        ),
        DrinkCard(
          text: "player1 has access to player2's phone for 30 seconds.",
          type: CardType.challenge,
        ),
        DrinkCard(
          text: "player1 has to swap their drinks with player2",
          type: CardType.challenge,
        ),
        DrinkCard(
          text: "player1 can give out 3 drinks to 3 people.",
          type: CardType.regular,
        ),
        DrinkCard(
          text:
              "Everyone who hasn't taken a sip in the last 3 cards has to finish their glass",
          type: CardType.regular,
        ),
        DrinkCard(
          text: "player1, you suck. Take 3 sips.",
          type: CardType.regular,
        ),
        DrinkCard(
          text:
              "Look at player1... just.. standing there, not drinking... Finish your damn glass.",
          type: CardType.regular,
        ),
        DrinkCard(
          text: "The last person to touch a fridge has to take 3 sips.",
          type: CardType.competition,
        ),
        DrinkCard(
          text:
              "player1 and player2 are having a staring contest. First one to blink drinks 3 sips.",
          type: CardType.competition,
        ),
        DrinkCard(
          text:
              "player1 and player2 are playing rock-paper-scissors, everyone makes a bet on who wins. The losers have to drink 3 sips.",
          type: CardType.competition,
        ),
        DrinkCard(
          text:
              "player1 has to challenge player2 to a push up contest. The person who has less push-ups in 30 seconds has to finish their drink.",
          type: CardType.competition,
        ),
        DrinkCard(
          text: "player1 is a literal god. They can set any rule.",
          type: CardType.rule,
        ),
        DrinkCard(
          text: "player1 sucks haha. They know have to drink double.",
          type: CardType.rule,
        ),
        DrinkCard(
          text: "Every person with blonde hair have to stand.",
          type: CardType.rule,
        ),
        DrinkCard(
          text:
              "player1 can ask a yes or no question. Every person who said yes has to drink 2 sips.",
          type: CardType.regular,
        ),
      ],
    ),
  ];
}
