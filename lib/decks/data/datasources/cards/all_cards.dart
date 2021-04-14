import 'package:drinkly/decks/domain/entities/drink_card.dart';

// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: prefer_single_quotes
// ignore_for_file: omit_local_variable_types
class AllCards {
  List<DrinkCard> getStandardCards() {
    // We get a list of all the standard cards
    List<DrinkCard> allCards = List.from(_standardDeckRegular)..shuffle();
    // We only want 25 cards, so we sublist the list to 25.
    final cards = allCards.sublist(0, 25);
    return cards;
  }

  List<DrinkCard> getMixedCards() {
    // We get a fixed amount of cards for each type of card, in this case
    // we are getting 16 standard cards,
    List<DrinkCard> standardCards = List.from(_standardDeckRegular)..shuffle();
    standardCards = standardCards.sublist(0, 16);
    // 3 challenge cards
    List<DrinkCard> challengeCards = List.from(_standardDeckChallenge)
      ..shuffle();
    challengeCards = challengeCards.sublist(0, 3);
    // 3 rule cards
    List<DrinkCard> ruleCards = List.from(_standardDeckRules)..shuffle();
    ruleCards = ruleCards.sublist(0, 3);
    // and 3 competition cards.
    List<DrinkCard> competitionCards = List.from(_standardDeckCompetition)
      ..shuffle();
    competitionCards = competitionCards.sublist(0, 3);
    // Here we combine all of the cards into one variable, where we mix
    // the result.
    final List<DrinkCard> output = List.from([
      ...standardCards,
      ...competitionCards,
      ...challengeCards,
      ...ruleCards
    ])
      ..shuffle();
    // And return the list of cards.
    return output;
  }

  final List<DrinkCard> _standardDeckCompetition = [
    DrinkCard(
      text: "The last person to stand up has to drink 3 sips.",
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
          "player1 has 30 seconds to name 10 Asain countries. If they fail they drink 3 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text: "First person to clap their hands can give out 4 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "NEVER HAVE I NEVER. player1 asks questions and everyone gets three lives. The first person who loses their lives has to drink 5 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "First person who has the least money in their wallet, give out 3 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "The person who speaks the most languages can name a person to take 3 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "Everyone stats clapping. The first person who stops must finish their drink.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "player1 and player2 have a race. The winner can make the loser drink 2 sips of any beverage.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "player1 and player2 must name a song. Everyone votes on the better song and the loser drinks 3 sips.",
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
          "player1 and player2 play rock-paper-scissors. Loser has to drink 4 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text: "The last person to touch their nose drinks 3 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text: "The last person to stand up and sit down has to drink 3 sips.",
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
    DrinkCard(
      text:
          "Everyone take out an object from their person. The player who has the most unusual object can give out 3 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text: "The first player to lick their elbow can give out 50 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "player1 and player2 must name as many elements on the periodic table as they can. The person with the lower number of named elements drinks 3.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "Everyone decides on the bigger history nerd, player1 or player2. The nerd can go ahead and drink 3 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text:
          "Everyone decides on the bigger science nerd, player1 or player2. The nerd can go ahead and drink 3 sips.",
      type: CardType.competition,
    ),
  ];

  final List<DrinkCard> _standardDeckRules = [
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
      text: "Every person with brown hair has to stand.",
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
      text:
          "player1 must not say anyone's name until the end of the round, otherwise they drink 2 sips.",
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          "No one can leave the game to go to the toilet until the end of the round.",
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          'The word "yes" is banned. You must drink 2 sips if you say the word.',
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          "Everyone must whisper until the end of the round. Every loud word is 2 sips.",
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          "Every player must switch their drink with a new varient until the end of the round.",
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          "When someone grabs a refill of their drink, the player with the least amount of liquid must finish their drink.",
      type: CardType.rule,
    ),
    DrinkCard(
      text: "player1 has to whisper until the end of the round.",
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          "No one can leave the game to go to the toilet until the end of the round.",
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          "Lighting a cigarette is now banned until the end of the round. Finish your drink if you don't want to follow.",
      type: CardType.rule,
    ),
    DrinkCard(
      text: "player1 can now give out 2 sips every time they take a sip.",
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          "player1 now has to drink an extra sip every time they have to drink.",
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          "player1, you must take off your shirt for 5 cards or drink 4 sips.",
      type: CardType.rule,
    ),
    DrinkCard(
      text:
          "player1 can now make a rule which only applies to player2. Be gentle.",
      type: CardType.rule,
    ),
    DrinkCard(
      text: "player1 can make a rule which only applies to the female players.",
      type: CardType.rule,
    ),
    DrinkCard(
      text: "player1 can make a rule which only applies to the male players.",
      type: CardType.rule,
    ),
    DrinkCard(
      text: "player1 can make a rule which applies to everyone",
      type: CardType.rule,
    ),
  ];

  final List<DrinkCard> _standardDeckChallenge = [
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
          "player1 has to say the entire alphabet in 7 seconds or drinks 4 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text: "player1 and player2 arm-wrestle. Loser finishes their drink.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 has to send any person that player2 says a message saying 'I miss us.' or drink 5 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 and player2. You take turns taking off pieces of clothing. The first person to give up has to drink 5 sips.",
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
      text: "player1. You have to uninstall Instagram or drink 6 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 must call their mom or dad and say that they are having a good time and not to worry or drink 5 sips.",
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
          "player1 must take any piece of clothing off for the rest of the game or drink 6 sips.",
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
    DrinkCard(
      text:
          "The first player who posts a picture on social media can tell another player to take 5 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "The floor is lava! The last person to remove their legs from the ground takes 2 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text: "player1 asks player2: truth or dare?",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 must name at least 10 African countries. If they fail, they drink 3 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text: "Send your ex the middle finger emoji or take 5 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "Name the sexiest feature of everyone playing drinkly or take 5 sips.",
      type: CardType.competition,
    ),
    DrinkCard(
      text: "Name the worst feature of everyone playing or drink 4 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "Send a spicy message to the last person you were messasing or drink 5 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "Send a person who is currently not playing drinkly the entire lyrics of Despactio or drink 5 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text: "Call the 10th person in your call log or drink 5 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1, tell us an embarassing story regarding another playing or drink 3 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text: "player1, do an impersonation of another player or drink 3 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1, take player2's phone and call the 5th person on their call log or both of you have to drink 5 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text: "TRUTH OR DARE: player1 asks player2, truth or dare?",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1, tell us the name of the last 3 people you texted or drink 5 sips.",
      type: CardType.challenge,
    ),
    DrinkCard(
      text:
          "player1 can choose any player who must call someone and then send them 'Sorry, wrong person.'",
      type: CardType.challenge,
    ),
  ];

  final List<DrinkCard> _standardDeckRegular = [
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
      text: "The person who last had a haircut drinks 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1, you look like you need a drink. Take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "If you are smoking a cigarette right now, take 2 sips. You know it's bad for you right?",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 can ask a yes or no question. Every person who said yes has to drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, hurry up and give us the zodiac sign of player2 or take 2 sips.",
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
      text: "player1 has to drink 2 sips and can give out 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1 chooses player2's drink for the next 10 cards.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, give 2 sips to a person who is taller than you, if there is no one, drink 3 sips and pat yourself on the back.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1 can choose to do 5 push-ups or to drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 must read out the last message on WhatsApp containing 'player2' out loud.",
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
      text: "player1 is unlucky and has to drink 3 sips.",
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
          "The person who has a glowing keyboard takes 3 sips and should finally feel the touch of a woman.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1 can give out 3 sips to three people.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "Everyone who hasn't taken a sip in the last 3 cards has to drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1, you suck. Take 2 sips.",
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
      text: "Haha, screw you player1. Drink 4 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 must tell us how they met player2. Everyone listens to the story while enjoying 2 sips of their drinks.",
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
      text: "The person who is playing the music can give out 3 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, what is player2's best ex? If they are in this room drink 5 sips and blush a little.",
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
    DrinkCard(
      text: "player1, you suck. Take 3 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you had a STD or a bad skin rash take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "People with red hair, give out 3 sips. If there aren't any, everyone takes a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, drink as many sips as there are people you would fu*k playing Drinkly right now.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1, you suck. Take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "Girls, drink as many sips as there are good looking guys playing Drinkly.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, if you are enjoying Drinkly give out 2 sips, if not drink them.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "Drink 2 sips if you ever had to ask your girlfriend/boyfriend if you can go out at night.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Players with the letter 'b' in their name must take a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "The player who has to drink the next card, give out 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, if you would kiss player2 take 2 sips, otherwise drink 3 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Non-smokers, take 3 sips. Also, be happy for yourself.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you can't pee while there are people around you, take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you are younger than player1, take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, you have a choice: either player2 gives out 4 sips, or a player you pick gives out 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1, drink 2 sips. player2, drink 3 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1, if there is a player that you don't know, drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, name as many famous scientists as you can and then give out that many sips. If you make a mistake, drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, what is player2's birthday? If you don't know drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, you can give out as many sips as there are glasses on the table.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 and player2 are running for president. Everyone votes on who the better president would be and the loser drinks 3 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1, give player2 1 dollar or finish your drink.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, if you have curly hair give out 2 sips, if not you got to drink those 2.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1, tell us a joke or drink a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Boys, 2 sips if you ever measured your penis.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "All players that aren't following player1 on Instagram, drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, go around all players and tap the heads of 2 people. Those 2 people have to drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1, follow 10 people on instagram or drink 3 times.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Take 2 sips if you have ever seen any of the players here naked.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "Players who have an M in your last name, this is your unlucky day. Take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, congratulations. You can transfer your sips to player2 twice in this game.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1, give out 2 sips to the person here you love the most.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If player1 has bigger hands than player2, everyone take a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 must explain to us why player2 is actually a good person and can hand out 3 sips. Otherwise they must drink 4 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "Every player with a pack of cigarettes, drink 1 sip for every cigarette up to 5 maximum.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Smokers who tried to stop but started again, drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, if you have ever finished a Rubik's cube, give out 2 sips, else drink them.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "The person who lives closest to here, give out 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "Who has prettier eyes, player1 or player2? It doesn't matter, they both have to drink 2 times.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Every player that has an Android phone must take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Every player that has iOS must take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "If player1 or player2 is playing drinkly with beer, everyone must take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you are playing drinkly with beer, take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you don't live in a city, take a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you ever talked about your ex on a first date.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 3 sips if you ever shoplifted. 🤨",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you ever smoked in a school bathroom. Wow.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 3 sips if you ever sleepwalked, also tell us what you did.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1 must say player2's birth month or drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you are wearing a watch.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, what is player2's eye color, if you don't know take two sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1, you must pick a person who will drink 5 sips with you.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 make a choice; who would be the best politician in this room? Also, drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If player1 is taller than player2, everyone drinks one sip!",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "If anyone who is playing drinkly is drunk, everyone but them must take 2 sips. Keep up!",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, tell us a bad trait of player2's? player2 must take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, you have 5 seconds to name a prime number. If you fail, drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 must describe photosynthesis. If they fail, they drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, you have to finish your drink, but there is a bright side. You can name a player who will also have to finish their drink.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "If you had a moment where you went viral or mini-viral, tell us and drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you swear infront of your parents.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you don't like beer, take a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "Players, if you had to drink more then 5 sips this game, take another sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "If player1 has to drink next card, he can choose a player to drink instead of him",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Do you think player1 is a bad person? Drink a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you ever punched someone full-fist, take a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you ever got punched, take a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you have ever been arrested or taken in, take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If player1 is male, everyone takes a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If player1 is female, everyone takes a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Everyone who's name starts with a syllable must take a sip.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you ever had a crush on a teacher, take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "Who would be a better teacher, player1 or player2? Everyone votes and the loser has to take 4 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you were drunk last week give out 3 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "If you puked this month, give out 4 sips, and also slow down a little.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1, say something you have never done, everyone who has done that must drink 3 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Take a sip for every grade of school or college you are in.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Every player who plays a sport must drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 and player2 must drink as many sips as they have exes combined.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you have been sick in the last 3 months, take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you had 'the virus', drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "If there are any players who are conspiracy theorists, everyone drinks 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Everyone must take a sip for every female players up to 4 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you don't smoke, take 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "player1 and player2 can both give out two sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "player1 can give out as many sips as they want to player2, but they also have to drink them.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you don't like whiskey, drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you don't like wine drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you have been on an airplane, give out 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you ever peed in the pool, drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you have ever been in a fight.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you are over 18, give out 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "If you have taken a call while at the movies, drink 2 sips.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you've ever been on a diet.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Give out 4 sips if you've ever sent nudes.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Give out 3 sips if you ever tried to set up your friend.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you had a bad sun burn.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 3 sips if you ever gave someone bad advice on purpose.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you ever broke a bone.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you have ever slid into someone's DMs.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you ever had surgery.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Give out 2 sips if you have ever or are wearing braces.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you have ever thrown up in public.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "Drink 2 sips if you have ever stalked a person you like on social media.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 3 sips if you have Twitter.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you are still active on Facebook.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you ever laughed at a funeral.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "Drink 2 sips if you ever had a fight with someone in the comment section of a video or article.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you ever ghosted anyone.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you ever got lost while drinking.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink a sip if you ever blamed alcohol for something you did.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you ever passed out from drinking.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you ever ran from the police.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you ever had a job.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you've ever been drunk to gain confidence.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you've ever slept outside while drunk.",
      type: CardType.regular,
    ),
    DrinkCard(
      text:
          "Drink 2 sips if a beverage was ruined for you because you got drunk from it.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you've ever seen your parents naked.",
      type: CardType.regular,
    ),
    DrinkCard(
      text: "Drink 2 sips if you've ever taken a body shot.",
      type: CardType.regular,
    ),
  ];
}
