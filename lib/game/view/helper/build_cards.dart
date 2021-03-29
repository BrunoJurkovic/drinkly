import 'package:drinkly/decks/models/card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardHelper {
  static Container buildFlipBack(
      double width, double height, List<DrinkCard> drinkCards, int index) {
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
            child: Container(
              padding: const EdgeInsets.only(
                top: 25,
              ),
              width: width * 0.7,
              child: Text(
                drinkCards[index].text,
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

  static Container buildFlipFront(
      double width, double height, List<DrinkCard> drinkCards, int index) {
    return Container(
      width: width * 0.85,
      height: height * 0.25,
      decoration: BoxDecoration(
        color: drinkCards[index].type == CardType.challenge
            ? Colors.pinkAccent[400]
            : (drinkCards[index].type == CardType.regular // TODO REWRITE
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

  static List<Widget> buildCardItems(
      List<DrinkCard> drinkCards, BuildContext context) {
    var cards = List<Widget>.generate(
      drinkCards.length,
      (index) {
        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;
        return FlipCard(
          key: ValueKey(drinkCards[index].text),
          front: buildFlipFront(width, height, drinkCards, index),
          back: buildFlipBack(width, height, drinkCards, index),
        );
      },
    );
    return cards;
  }
}
