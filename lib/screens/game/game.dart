import 'package:drinkly/models/card.dart';
import 'package:drinkly/models/deck.dart';
import 'package:drinkly/services/game_logic.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tcard/tcard.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key key, this.id}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();

  final String id;
}

class _GameScreenState extends State<GameScreen> {
  Deck deck;
  List<DrinkCard> cards = [];
  bool isInit = false;

  @override
  void didChangeDependencies() {
    if (!isInit) {
      setState(() {
        this.deck = Provider.of<GameLogic>(context, listen: false)
            .getSelectedDeck(widget.id);
        this.cards = Provider.of<GameLogic>(context, listen: false)
            .processCards(deck.cards);
      });

      isInit = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Game on!',
          style: GoogleFonts.poppins(
            fontSize: height * 0.025,
            color: Colors.white.withOpacity(0.65),
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xff2a2438),
      ),
      backgroundColor: Color(0xff2a2438),
      body: Column(
        children: [
          Center(
            child: TCard(
              cards: <Widget>[...buildCardItems(cards)],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildCardItems(List<DrinkCard> drinkCards) {
    String text;
    List cards = List<Widget>.generate(
      drinkCards.length,
      (index) {
        text = Provider.of<GameLogic>(context, listen: false)
            .returnText(drinkCards[index])
            .text;
        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;
        return FlipCard(
          key: ValueKey(drinkCards[index].text),
          flipOnTouch: true,
          onFlip: () {
            print('flip');
          },
          front: Container(
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
              borderRadius: BorderRadius.all(
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
                  fontSize: height * 0.05,
                  color: Colors.white.withOpacity(1),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          back: Container(
            width: width * 0.85,
            height: height * 0.25,
            decoration: BoxDecoration(
              color: Color(0xff352f44),
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    height: height * 0.1,
                    width: width * 0.7,
                    child: Image.asset(
                        "assets/images/${drinkCards[index].type == CardType.challenge ? 'challenge.png' : (drinkCards[index].type == CardType.regular ? 'regular.png' : (drinkCards[index].type == CardType.rule ? 'rule.png' : (drinkCards[index].type == CardType.competition ? 'competition.png' : 'regular.png')))}")),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    width: width * 0.7,
                    child: Text(
                      text,
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
          ),
        );
      },
    );
    return cards;
  }
}
