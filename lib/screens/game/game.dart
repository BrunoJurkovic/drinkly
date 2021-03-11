import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drinkly/models/card.dart';
import 'package:drinkly/models/deck.dart';
import 'package:drinkly/models/player.dart';
import 'package:drinkly/services/game_logic.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
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
  TCardController _controller = TCardController();
  int frontCardIndex = 0;
  bool isModified = false;

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
    List<Player> players =
        Provider.of<GameLogic>(context, listen: true).players;
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.15),
          Center(
            child: Text(
              '$frontCardIndex/50 cards',
              style: GoogleFonts.poppins(
                fontSize: height * 0.025,
                color: Colors.white.withOpacity(0.65),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Center(
            child: players.isEmpty
                ? Text(
                    'Please add at least 2 players to continue the game.',
                    style: GoogleFonts.poppins(
                      fontSize: height * 0.02,
                      color: Colors.white.withOpacity(0.65),
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : TCard(
                    controller: _controller,
                    onEnd: () async {
                      await AwesomeDialog(
                        context: context,
                        dialogType: DialogType.INFO,
                        animType: AnimType.RIGHSLIDE,
                        title: 'You got to the end!',
                        desc:
                            'Congrats! Pick a new gamemode or play this one again for new cards!',
                        btnCancelOnPress: () {
                          ExtendedNavigator.root.pop();
                        },
                        btnOkOnPress: () {
                          ExtendedNavigator.root.pop();
                        },
                      )
                        ..show();
                    },
                    onForward: (ind, __) {
                      setState(() {
                        frontCardIndex = ind;
                      });
                    },
                    cards: <Widget>[...buildCardItems(cards, frontCardIndex)],
                  ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, height * 0.15, 0, 0),
            child: IconButton(
              iconSize: height * 0.045,
              icon: Icon(CupertinoIcons.person_add_solid),
              onPressed: () async {
                await buildModalBottomSheet(context, height, players);
                // if (isModified) {
                //   _controller.state.reset(
                //       cards: buildCardItems(
                //           cards.sublist(frontCardIndex), frontCardIndex));
                //   setState(() {
                //     isModified = false;
                //   });
                // }
              },
            ),
          ),
        ],
      ),
    );
  }

  buildModalBottomSheet(
      BuildContext context, double height, List<Player> players) async {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctx) {
          return StatefulBuilder(
            builder: (ctx, stateSetter) => Container(
              height: height * 0.4,
              decoration: BoxDecoration(
                color: Color(0xff352f44),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                        child: Text(
                          'All players',
                          style: GoogleFonts.poppins(
                            fontSize: height * 0.02,
                            color: Colors.white.withOpacity(0.65),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      IconButton(
                          icon: Icon(CupertinoIcons.add),
                          onPressed: () async {
                            final name = await showTextInputDialog(
                              context: context,
                              title: 'What is the player\'s name?',
                              style: AdaptiveStyle.material,
                              textFields: [
                                DialogTextField(
                                  keyboardType: TextInputType.name,
                                  hintText: 'John',
                                ),
                              ],
                            );
                            final sex = await showConfirmationDialog(
                                context: context,
                                title: 'Which sex is the player?',
                                actions: [
                                  AlertDialogAction(
                                      label: 'Male', key: Sex.male),
                                  AlertDialogAction(
                                      label: 'Female', key: Sex.female),
                                ]);
                            name != null && sex != null
                                ? stateSetter(() {
                                    isModified = true;

                                    Provider.of<GameLogic>(context,
                                            listen: false)
                                        .addPlayer(
                                      Player(
                                        name: name[0],
                                        sex: sex,
                                      ),
                                    );
                                  })
                                : DoNothingAction();
                            _controller.state.reset(
                                cards: buildCardItems(
                                    cards.sublist(frontCardIndex),
                                    frontCardIndex));
                          }),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: players.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (ctx, ind) {
                        return Chip(
                          key: UniqueKey(),
                          onDeleted: () {
                            stateSetter(() {
                              Provider.of<GameLogic>(context, listen: false)
                                  .removePlayer(players[ind]);
                            });
                          },
                          deleteIcon: Icon(
                            CupertinoIcons.delete,
                            size: 12,
                          ),
                          label: Text(
                            players[ind].name,
                            style: GoogleFonts.poppins(
                              fontSize: height * 0.02,
                              color: Colors.white.withOpacity(0.65),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  List<Widget> buildCardItems(List<DrinkCard> drinkCards, int frontCardIndex) {
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
                  fontSize: height * 0.049,
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
                      top: 25,
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
