import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../decks/domain/entities/drink_card.dart';

List<Widget> buildCardItems(
  List<DrinkCard> drinkCards,
  BuildContext context,
  List<String> cardTexts,
) {
  var cards = List<Widget>.generate(
    drinkCards.length,
    (index) {
      final height = MediaQuery.of(context).size.height;
      final width = MediaQuery.of(context).size.width;
      return FlipCard(
        key: ValueKey(cardTexts[index]),
        flipOnTouch: true,
        speed: 250,
        front: buildFront(width, height, drinkCards, index),
        back: buildBack(width, height, drinkCards, index, cardTexts),
      );
    },
  );
  return cards;
}

Container buildBack(double width, double height, List<DrinkCard> drinkCards,
    int index, List<String> cardTexts) {
  return Container(
    width: width * 0.85,
    height: height * 0.25,
    decoration: const BoxDecoration(
      color: Color(0xff352f44),
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
    ),
    child: Column(
      children: [
        Container(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            height: height * 0.1,
            width: width * 0.7,
            child: Image.asset(
                "assets/images/${drinkCards[index].type == CardType.challenge ? 'challenge.png' : (drinkCards[index].type == CardType.regular ? 'regular.png' : (drinkCards[index].type == CardType.rule ? 'rule.png' : (drinkCards[index].type == CardType.competition ? 'competition.png' : 'regular.png')))}")),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              cardTexts[index],
              style: GoogleFonts.poppins(
                fontSize: height * 0.02,
                color: Colors.white.withOpacity(1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Container buildFront(
    double width, double height, List<DrinkCard> drinkCards, int index) {
  return Container(
    width: width * 0.85,
    height: height * 0.25,
    decoration: BoxDecoration(
      color: drinkCards[index].type == CardType.challenge
          ? Colors.pinkAccent[400]
          : (drinkCards[index].type == CardType.regular
              ? Colors.blueAccent
              : (drinkCards[index].type == CardType.rule
                  ? Colors.green[600]
                  : (drinkCards[index].type == CardType.competition
                      ? Colors.red
                      : Colors.brown))),
      borderRadius: const BorderRadius.all(
        Radius.circular(25),
      ),
    ),
    child: Center(
      child: Text(
        drinkCards[index].type == CardType.challenge
            ? 'CHALLENGE'
            : (drinkCards[index].type == CardType.regular
                ? 'NORMAL'
                : (drinkCards[index].type == CardType.rule
                    ? 'RULE'
                    : (drinkCards[index].type == CardType.competition
                        ? 'COMPETITION'
                        : 'NORMAL'))),
        style: GoogleFonts.poppins(
          fontSize: height * 0.049,
          color: Colors.white.withOpacity(1),
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}
