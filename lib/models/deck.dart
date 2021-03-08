import 'package:drinkly/models/card.dart';

class Deck {
  final String name;
  final String id;
  final List<DrinkCard> cards;
  final bool isOwned;

  Deck({this.name, this.id, this.cards, this.isOwned});

  static List<DrinkCard> standardDeckCompetition = [
    DrinkCard(
      text: "The last person to stand up has to finish their drink.",
      type: CardType.competition,
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
      text:
          "Last person to open their phone, take a selfie, and post it on close friends on their instagram have to finish their drink.",
      type: CardType.competition,
    ),
    DrinkCard(
      text: "First person to clap their hands can give out 5 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "NEVER HAVE I NEVER. player1 asks questions and everyone gets three lives. The first person who loses their lives has to drink 6 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text: "The person who knows the longest German word can give out 4 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "The person who speaks the most languages can name a person to take 4 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "Everyone stats clapping. The first person who stops must finish their drink.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "player1 and player2 have a race. The winner can make the loser drink 3 sips of any beverage.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "player1 and player2 must sing their favorite song. Everyone votes which song they liked more. The loser has to drink 5 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "HEADS OR TAILS: Everyone says either heads or tails. The host flips a coin and the losers have to drink as many sips as there are losers.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "player1 and player2 both have to diss eachother one time. Everyone votes on the better diss and the loser has to leave the game for this round. Sucks to be you.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "player1 and player2 play rock-paper-scissors. Loser has to drink 5 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text: "The last person to touch their nose drinks 5 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text: "The last person to stand up and sit down has to drink 4 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "When player1 starts drinking everyone starts drinking. The first person who stops must drink an additional 3 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "player1 and player2 are brawling. Whoever of the both players finish each others drink first can make any rule involving the loser for the rest of the round.",
      type: CardType.competition,
    ),
  ];

  static List<DrinkCard> standardDeckRules = [
    DrinkCard(
      text: "player1 is a literal god. They can set any rule.",
      type: CardType.rule,
    ),
    DrinkCard(
      text: "player1 sucks haha. They know have to drink double.",
      type: CardType.rule,
    ),
    DrinkCard(
      text: "Every person with blonde hair has to stand.",
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          "player1 can make a rule that player2 must follow for the next 5 cards.",
      type: CardType.rule,
    ),
    DrinkCard(
      text: "player1 must face the other way from the rest of the player",
      type: CardType.rule,
    ),
    DrinkCard(
      text: "When player1 or player2 swear, everyone takes a sip.",
      type: CardType.rule,
    ),
    DrinkCard(
      text: "Whoever touches the table must take 2 sips.",
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          "If player1 chooses so, they can make player2 drink double, but they must also drink double for the rest of the round.",
      type: CardType.rule,
    ),
    DrinkCard(
      text: "Every person with brown hair have to stand.",
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          "Every person but the host must put their phone on the table and not touch it until the end of the round.",
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          "If you hum or sing to the song that is playing, you must drink 2 sips.",
      type: CardType.rule,
    ),
    DrinkCard(
      text: "player1 must not say anyone's name until the end of the round.",
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          "No one can leave the game to go to the toilet until the end of the round.",
      type: CardType.rule,
    ),
  ];

  static List<DrinkCard> standardDeckChallenge = [
    DrinkCard(
      text: "player1 has access to player2's phone for 30 seconds.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text: "player1 has to swap their drinks with player2",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 has to say the entire alphabet in 7 seconds or drinks 5 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text: "player1 and player2 arm-wrestle. Loser finishes their drink.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 has to send any person that player2 says a message saying 'I miss us.' or drink 7 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 and player2. You take turns taking off pieces of clothing. The first person to give up has to finish their drink.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 has to sit in player2's laps for the next 5 cards. Oupsie.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 has access to player2's camera roll for the next 20 seconds. If player1 says no they have to drink 6 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 must send a snap of player2 to a person they don't like on Snapchat.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text: "player1. You have to uninstall Instagram or drink 10 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 must call their mom or dad and say that they are having a good time and not to worry.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text: "player1 must slap player2's butt. Oups.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 must do a squat with player2 on their shoulder. If they fall or fail they both drink 5 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 must take any piece of clothing off for the rest of the game or drink 10 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 must kiss player2 on the forehead and whisper sweet words into their ear or drink 4 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 must stand up and stand in a corner for the rest of the game. If they don't want to they have to finish their drink.",
      type: CardType.challenge,
    ),
  ];

  static List<DrinkCard> standardDeckRegular = [
    DrinkCard(
      text:
          "player1 can ask a yes or no question. Every person who said yes has to drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "All girls say cheers and take a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Everyone who is not wearing white shoes has to take a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If player1 is taller than player2, everyone drinks a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "If there is at least one ex-couple playing Drinkly, everyone drinks a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "The person who last had a haircut drinks 3 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1, you look like you need a drink. Take 3 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "If you are smoking a cigarette right now, take 5 sips. You know it's bad for you right?",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 can ask a yes or no question. Every person who said yes has to drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, hurry up and give us the zodiac sign of player2 or take 3 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 can choose the next song, everyone who think it is bad has to take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "Everyone who has been on TV in the last 3 years has to take 3 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 can ask a yes or no question. Every person who said yes has to drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "The last person who has joined the game has to finish their drink. Oh no, anyway..",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1 has to drink 3 sips and can give out 3 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1 chooses player2's drink for the next 10 cards.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, give 2 sips to a person who is taller than you, if there is no one, drink 4 sips and pat yourself on the back.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1 can choose to do 5 push-ups or 2 drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 must read out the last message on WhatsApp containing 'love' out loud.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1, if you know player2 drink 2 sips.",
      type: CardType.regular,
    ),
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
      text:
          "The person who has a glowing keyboard takes 3 sips and should finally taste the touch of a woman.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1 can give out 3 drinks to three people.",
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
      text: "Drink 2 sips if you ever kissed a person of the same gender.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink a sip if you are single, 2 if you are in a relationship.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 has to drink as many sips as the number of countries they have visited.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "If you ever heard your parents or siblings having sex, take 2 sips. Also, I feel sorry for your trauma.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 and player2 have to both drink 3 sips. Why them? I don't know.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "If you have ever told a child that Santa isn't real, take 3 sips you monster.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "The person who is currently hosting the game of Drinkly, give out 5 sips you magnificient person!",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "If you are balding, take 2 sips and don't try any of those BS creams.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "Girls have to drink as many sips as the number of handsome or cute looking dudes playing Drinkly.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Haha, screw you player1. Finish your drink.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 must tell us how they met player2. Everyone listens to the story while enjoying 3 sips of their drinks.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you ever played a video game with player1",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "When the clock rounds up the first time (12:00, 12:10, 12:30...) the first person to yell 'FUC* I DIDN'T FEED MY CAT SINCE LAST WEEK.' can give out 5 sips to five people.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1 and player2 have to switch seats.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 can give out three sips to the most beautiful person playing Drinkly",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Ayo DJ! Give out 3 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, what is player2's best ex? If he is in this room drink 5 sips and blush a little.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "If player1 and player2 are good friends, everyone say cheers and wish them a long friendship!",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1, give out 3 sips to the Drinkly player you know the best.",
      type: CardType.regular,
    ),
  ];

  static List<DrinkCard> mixAndMatchCards(
      {List<DrinkCard> standards,
      List<DrinkCard> challenges,
      List<DrinkCard> competitions,
      List<DrinkCard> rules}) {
    List<DrinkCard> standardCards = standards;
    standardCards.shuffle();
    standardCards = standardCards.sublist(0, 25);
    List<DrinkCard> challengeCards = challenges;
    challengeCards.shuffle();
    challengeCards = challengeCards.sublist(0, 10);
    List<DrinkCard> competitionCards = competitions;
    competitionCards.shuffle();
    competitionCards = competitionCards.sublist(0, 8);
    List<DrinkCard> ruleCards = rules;
    ruleCards.shuffle();
    ruleCards = ruleCards.sublist(0, 7);

    List<DrinkCard> output = [];
    output.addAll(standardCards);
    output.addAll(challengeCards);
    output.addAll(competitionCards);
    output.addAll(ruleCards);
    output.shuffle();
    return output;
  }

  static List<DrinkCard> standardCards = List.from(mixAndMatchCards(
      standards: standardDeckRegular,
      challenges: standardDeckChallenge,
      competitions: standardDeckCompetition,
      rules: standardDeckRules));

  static List<Deck> decks = [
    Deck(
      name: "Let's get the party started!",
      id: 'standard',
      isOwned: true,
      cards: standardCards,
    ),
  ];
}
