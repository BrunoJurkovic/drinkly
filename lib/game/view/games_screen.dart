import 'dart:async';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drinkly/app/injection_container.dart';
import 'package:drinkly/decks/decks.dart';
import 'package:drinkly/decks/models/card.dart';
import 'package:drinkly/game/bloc/game_bloc.dart';
import 'package:drinkly/players/players.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcard/tcard.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({Key? key, required this.deck}) : super(key: key);
  final DeckType deck;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameBloc>(
          create: (ctx) => sl<GameBloc>(),
        ),
        BlocProvider<PlayerCubit>(
          create: (ctx) => sl<PlayerCubit>(),
        )
      ],
      child: GamesView(
        deck: deck,
      ),
    );
  }
}

class GamesView extends StatefulWidget {
  const GamesView({Key? key, required this.deck}) : super(key: key);
  final DeckType deck;
  @override
  _GamesViewState createState() => _GamesViewState();
}

class _GamesViewState extends State<GamesView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    context.read<GameBloc>().add(GamePrepare(deck: widget.deck));
    return Scaffold(
      backgroundColor: const Color(0xff2a2438),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.075),
        child: GameAppBar(height: height),
      ),
      body: const GameBody(),
    );
  }
}

class GameBody extends StatefulWidget {
  const GameBody({
    Key? key,
  }) : super(key: key);

  @override
  _GameBodyState createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  final _controller = TCardController();
  var frontCardIndex = 0;

  void callback(int index) {
    setState(() {
      frontCardIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    var players = context.read<PlayerCubit>().state;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.15),
        Center(
          child: Text(
            '$frontCardIndex/25 cards',
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
              : CardStack(controller: _controller, callback: callback),
        ),
        Expanded(
          child: SafeArea(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        var isModified = false;
                        return StatefulBuilder(builder: (ctx, stateSetter) {
                          return Container(
                            height: height * 0.4,
                            decoration: const BoxDecoration(
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
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(CupertinoIcons.add),
                                  onPressed: () async {
                                    final name = await showTextInputDialog(
                                      context: context,
                                      title: 'What is the player\'s name?',
                                      style: AdaptiveStyle.material,
                                      textFields: [
                                        const DialogTextField(
                                          keyboardType: TextInputType.name,
                                          hintText: 'John',
                                        ),
                                      ],
                                    );
                                    name != null
                                        ? stateSetter(() {
                                            isModified = true;

                                            // Provider.of<GameLogic>(context,
                                            //         listen: false)
                                            //     .addPlayer(
                                            //   Player(
                                            //     name: name[0],
                                            //   ),
                                            // );
                                          })
                                        : DoNothingAction();
                                    _controller.state.reset(cards: []);
                                  },
                                ),
                                Expanded(
                                  child: GridView.builder(
                                    itemCount: players.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4),
                                    itemBuilder: (ctx, ind) {
                                      return Chip(
                                        key: UniqueKey(),
                                        onDeleted: () {
                                          stateSetter(() {
                                            // Provider.of<GameLogic>(context,
                                            //         listen: false)
                                            //     .removePlayer(players[ind]);
                                          });
                                          // _controller.state.reset(
                                          //     cards: buildCardItems(
                                          //         cards.sublist(frontCardIndex),
                                          //         frontCardIndex,
                                          //         _controller
                                          //             .state?.frontCardIndex));
                                        },
                                        deleteIcon: Icon(
                                          CupertinoIcons.delete,
                                          size: 12,
                                        ),
                                        label: Text(
                                          players[ind].name,
                                          style: GoogleFonts.poppins(
                                            fontSize: height * 0.02,
                                            color:
                                                Colors.white.withOpacity(0.65),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                      },
                    );
                  },
                  icon: const Icon(CupertinoIcons.person_add_solid, size: 34),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CardStack extends StatefulWidget {
  const CardStack({
    Key? key,
    required this.callback,
    required TCardController controller,
  })   : _controller = controller,
        super(key: key);

  final TCardController _controller;
  final Function callback;

  @override
  _CardStackState createState() => _CardStackState();
}

class _CardStackState extends State<CardStack> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        print(state.toString());
        if (state is GameLoaded) {
          return buildCardWidget(context, state);
        }
        return Container();
      },
    );
  }

  Widget buildCardWidget(BuildContext context, GameLoaded state) {
    return TCard(
      controller: widget._controller,
      onEnd: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.INFO,
          animType: AnimType.RIGHSLIDE,
          title: 'You got to the end!',
          desc:
              'Congrats! Pick a new gamemode or play this one again for new cards!',
          btnCancelOnPress: () {
            AutoRouter.of(context).pop();
          },
          btnOkOnPress: () {
            AutoRouter.of(context).pop();
          },
        ).show();
      },
      onForward: (ind, __) {
        widget.callback(ind);
      },
      cards: <Widget>[...buildCardItems(state.cards)],
    );
  }

  Container buildFlipBack(
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

  Container buildFlipFront(
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

  List<Widget> buildCardItems(List<DrinkCard> drinkCards) {
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

class GameAppBar extends StatelessWidget {
  const GameAppBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: [
        IconButton(
            icon: const Icon(CupertinoIcons.question_circle),
            onPressed: () {
              _buildTutorialDialog(context);
            }),
      ],
      title: Text(
        'Game on!',
        style: GoogleFonts.poppins(
          fontSize: height * 0.025,
          color: Colors.white.withOpacity(0.65),
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: const Color(0xff2a2438),
    );
  }

  void _buildTutorialDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.BOTTOMSLIDE,
      title: 'How to play?',
      desc: '''
When the card says "give out x sips",
that means that the player
who can give out sips can choose to distribute
the sips in any way they want, for example:
player1 gets to give out 3 sips, they can give
out 2 to player2 and 1 to player3 or he can make
one player drink it all."''',
      btnOkOnPress: () {},
    ).show();
  }
}
