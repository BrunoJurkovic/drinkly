import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drinkly/app/dependency_injection.dart';
import 'package:drinkly/decks/domain/entities/drink_card.dart';
import 'package:drinkly/decks/presentation/bloc/decks_bloc.dart';
import 'package:drinkly/game/presentation/bloc/game_bloc.dart';
import 'package:drinkly/players/domain/entities/player.dart';
import 'package:drinkly/players/presentation/cubit/player_cubit.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcard/tcard.dart';

import 'package:drinkly/decks/domain/entities/deck.dart';
import 'package:auto_route/auto_route.dart';

class GamePage extends StatelessWidget {
  GamePage({Key? key, required this.deck}) : super(key: key);
  final Deck deck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        child: GameAppBar(),
        preferredSize: Size.fromHeight(50),
      ),
      backgroundColor: const Color(0xff2a2438),
      body: GameBody(deck: deck),
    );
  }
}

class GameBody extends StatefulWidget {
  const GameBody({Key? key, required this.deck}) : super(key: key);

  final Deck deck;

  @override
  _GameBodyState createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  var frontCardIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final controller = TCardController();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<PlayerCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<GameBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<DecksBloc>(),
        ),
      ],
      child: BlocListener<PlayerCubit, List<Player>>(
        listener: (context, state) {
          context.read<DecksBloc>().add(DecksGet());
          context.read<GameBloc>().add(
                GameInitialize(players: state, cards: widget.deck.cards),
              );
          final gameState = context.read<GameBloc>().state;
          if (gameState is GameLoaded) {
            var cards =
                buildCardItems(widget.deck.cards, context, gameState.cards);
            controller.state?.reset(
              cards: <Widget>[...cards],
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.15),
            CardCountWidget(frontCardIndex: frontCardIndex),
            CardGame(
              controller: controller,
              updateIndex: _updateIndex,
              cards: widget.deck.cards,
            ),
            // AddPlayerSheetButton(
            //   controller: controller,
            //   frontCardIndex: frontCardIndex,
            // ),
          ],
        ),
      ),
    );
  }

  void _updateIndex() {
    setState(() {
      frontCardIndex++;
    });
  }
}

class AddPlayerSheetButton extends StatelessWidget {
  const AddPlayerSheetButton({
    Key? key,
    required this.controller,
    required this.frontCardIndex,
  }) : super(key: key);

  final TCardController controller;
  final int frontCardIndex;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, height * 0.15, 0, 0),
      child: IconButton(
        iconSize: height * 0.045,
        icon: const Icon(CupertinoIcons.person_add_solid),
        onPressed: () async {
          buildModalBottomSheet(context, height, controller);
        },
      ),
    );
  }
}

class CardGame extends StatefulWidget {
  const CardGame({
    Key? key,
    required this.controller,
    required this.updateIndex,
    required this.cards,
  }) : super(key: key);

  final TCardController controller;
  final Function updateIndex;
  final List<DrinkCard> cards;

  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    var players = context.watch<PlayerCubit>().state;
    return Center(
      child: players.isEmpty
          ? add2PlayersText(height)
          : BlocBuilder<GameBloc, GameState>(
              builder: (context, state) {
                if (state is GameInitial) {
                  context.read<GameBloc>().add(
                        GameInitialize(
                          players: players,
                          cards: widget.cards,
                        ),
                      );
                  context.read<DecksBloc>().add(DecksGet());
                } else if (state is GameLoaded) {
                  return TCard(
                    controller: widget.controller,
                    onEnd: () async {
                      await buildOnEndDialog(context).show();
                    },
                    onForward: (ind, __) {
                      widget.updateIndex();
                    },
                    cards: <Widget>[
                      ...buildCardItems(widget.cards, context, state.cards)
                    ],
                  );
                }
                return const Text('unexpected error');
              },
            ),
    );
  }

  AwesomeDialog buildOnEndDialog(BuildContext context) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.RIGHSLIDE,
      title: 'You got to the end!',
      desc:
          'Congrats! Pick a new gamemode or play this one again for new cards!',
      btnCancelOnPress: () {
        context.router.pop();
      },
      btnOkOnPress: () {
        context.router.pop();
      },
    );
  }

  Text add2PlayersText(double height) {
    return Text(
      'Please add at least 2 players to continue the game.',
      style: GoogleFonts.poppins(
        fontSize: height * 0.03,
        color: Colors.white.withOpacity(0.65),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class CardCountWidget extends StatelessWidget {
  const CardCountWidget({
    Key? key,
    required this.frontCardIndex,
  }) : super(key: key);

  final int frontCardIndex;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: Text(
        '$frontCardIndex/25 cards',
        style: GoogleFonts.poppins(
          fontSize: height * 0.025,
          color: Colors.white.withOpacity(0.65),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class GameAppBar extends StatelessWidget {
  const GameAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return AppBar(
      elevation: 0,
      actions: [
        buildTutorialButton(context),
      ],
      title: buildAppHeaderText(height),
      backgroundColor: const Color(0xff2a2438),
    );
  }

  Text buildAppHeaderText(double height) {
    return Text(
      'Game on!',
      style: GoogleFonts.poppins(
        fontSize: height * 0.025,
        color: Colors.white.withOpacity(0.65),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  IconButton buildTutorialButton(BuildContext context) {
    return IconButton(
        icon: const Icon(CupertinoIcons.question_circle),
        onPressed: () {
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
          )..show();
        });
  }
}

void buildModalBottomSheet(
  BuildContext context,
  double height,
  TCardController controller,
) async {
  await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return BlocProvider(
          create: (context) => sl<PlayerCubit>(),
          child: StatefulBuilder(
            builder: (ctx, stateSetter) => ModalBody(
              stateSetter: stateSetter,
              context: context,
              controller: controller,
            ),
          ),
        );
      });
}

class ModalBody extends StatelessWidget {
  const ModalBody(
      {Key? key,
      required this.stateSetter,
      required this.context,
      required this.controller})
      : super(key: key);

  final Function stateSetter;
  final BuildContext context;
  final TCardController controller;

  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext ctx) {
    final height = MediaQuery.of(context).size.height;
    var players = context.watch<PlayerCubit>().state;
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
              allPlayersText(height),
              //addPlayersButton(),
            ],
          ),
          Expanded(
            child: GridView.builder(
              itemCount: players.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (ctx, ind) {
                return buildPlayerChipItem(players, ind, height);
              },
            ),
          ),
        ],
      ),
    );
  }

  Chip buildPlayerChipItem(List<Player> players, int ind, double height) {
    return Chip(
      key: UniqueKey(),
      onDeleted: () {
        stateSetter(() {
          context.read<PlayerCubit>().removePlayer(players[ind].name);
        });
        stateSetter(() {});
      },
      deleteIcon: const Icon(
        CupertinoIcons.delete,
        size: 12,
      ),
      label: buildPlayerName(players, ind, height),
    );
  }

  Text buildPlayerName(List<Player> players, int ind, double height) {
    return Text(
      players[ind].name,
      style: GoogleFonts.poppins(
        fontSize: height * 0.02,
        color: Colors.white.withOpacity(0.65),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  IconButton addPlayersButton() {
    return IconButton(
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
                  context.read<PlayerCubit>().addPlayer(name[0]);
                })
              : DoNothingAction();
          // _controller.state.reset(
          //     cards: buildCardItems(
          //         cards.sublist(frontCardIndex),
          //         frontCardIndex,
          //         _controller.state?.frontCardIndex));
          stateSetter(() {});
        });
  }

  Padding allPlayersText(double height) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
      child: Text(
        'All players',
        style: GoogleFonts.poppins(
          fontSize: height * 0.02,
          color: Colors.white.withOpacity(0.65),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

List<Widget> buildCardItems(
  List<DrinkCard> drinkCards,
  BuildContext context,
  List<String> cardTexts,
) {
  debugPrint('ran');
  var cards = List<Widget>.generate(
    drinkCards.length,
    (index) {
      final height = MediaQuery.of(context).size.height;
      final width = MediaQuery.of(context).size.width;
      return FlipCard(
        key: ValueKey(cardTexts[index]),
        flipOnTouch: true,
        speed: 250,
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
        ),
        back: Container(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
        ),
      );
    },
  );
  return cards;
}
