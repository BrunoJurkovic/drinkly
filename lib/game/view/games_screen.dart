import 'package:adaptive_dialog/adaptive_dialog.dart';
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
          BlocProvider.value(
            value: sl<GameBloc>(),
          ),
          BlocProvider.value(
            value: sl<PlayerCubit>(),
          )
        ],
        child: GamesView(
          deck: deck,
        ));
  }
}

class GamesView extends StatefulWidget {
  const GamesView({Key? key, required this.deck}) : super(key: key);

  @override
  _GamesViewState createState() => _GamesViewState();

  final DeckType deck;
}

class _GamesViewState extends State<GamesView> {
  Deck? deck;
  List<DrinkCard> cards = [];
  final TCardController _controller = TCardController();
  int frontCardIndex = 0;
  bool isModified = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    var players = context.watch<PlayerCubit>().state;
    return Scaffold(
      appBar: buildAppBar(context, height),
      backgroundColor: const Color(0xff2a2438),
      body: Column(
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
          BlocBuilder<GameBloc, GameState>(
            builder: (context, state) {
              context.read<GameBloc>().add(GamePrepare(deck: widget.deck));
              if (state is GameLoaded) {
                return Center(
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
                              btnOkOnPress: () {
                                // ExtendedNavigator.root.pop();
                              },
                            ).show();
                          },
                          onForward: (ind, __) {
                            setState(() {
                              frontCardIndex = ind;
                            });
                          },
                          cards: <Widget>[
                            ...buildCardItems(
                              state.cards,
                            )
                          ],
                        ),
                );
              }
              return Container();
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, height * 0.15, 0, 0),
            child: IconButton(
              iconSize: height * 0.045,
              icon: const Icon(CupertinoIcons.person_add_solid),
              onPressed: () async {
                await buildModalBottomSheet(context, height, players);
                if (isModified) {
                  _controller.state.reset(
                    cards: buildCardItems(cards.sublist(frontCardIndex)),
                  );
                  setState(() {
                    isModified = false;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, double height) {
    return AppBar(
      elevation: 0,
      actions: [
        IconButton(
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

  dynamic buildModalBottomSheet(
      BuildContext context, double height, List<Player> players) async {
    await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (ctx) {
          return StatefulBuilder(
            builder: (ctx, stateSetter) => Container(
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
                        padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
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
                                    context.read<PlayerCubit>().addPlayer(
                                          name: name[0],
                                        );
                                    context.read<GameBloc>().add(
                                          GameReloaded(
                                            deck: DeckType.standard,
                                          ),
                                        );
                                  })
                                : DoNothingAction();
                            _controller.state.reset(
                              cards: buildCardItems(
                                cards.sublist(frontCardIndex),
                              ),
                            );
                          }),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: players.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemBuilder: (ctx, ind) {
                        return Chip(
                          key: UniqueKey(),
                          onDeleted: () {
                            stateSetter(() {
                              context.read<PlayerCubit>().removePlayer(
                                    name: players[ind].name,
                                  );
                              context.read<GameBloc>().add(
                                    GameReloaded(
                                      deck: DeckType.standard,
                                    ),
                                  );
                            });
                            _controller.state.reset(
                              cards: buildCardItems(
                                cards.sublist(frontCardIndex),
                              ),
                            );
                          },
                          deleteIcon: const Icon(
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

  // List<Widget> buildCardItems(
  //     List<DrinkCard> drinkCards, int frontCardIndex, int ind) {
  //   String text;
  //   List cards = List<Widget>.generate(
  //     drinkCards.length,
  //     (index) {
  //       // text = Provider.of<GameLogic>(context, listen: false)
  //       //     .returnText(drinkCards[index])
  //       //     .text;
  //       final height = MediaQuery.of(context).size.height;
  //       final width = MediaQuery.of(context).size.width;
  //       return FlipCard(
  //         key: ValueKey(drinkCards[index].text),
  //         flipOnTouch: true,
  //         speed: 250,
  //         onFlip: () {
  //           print('flip');
  //         },
  //         front: Container(
  //           width: width * 0.85,
  //           height: height * 0.25,
  //           decoration: BoxDecoration(
  //             color: drinkCards[index].type == CardType.challenge
  //                 ? Colors.pinkAccent[400]
  //                 : (drinkCards[index].type == CardType.regular
  //                     ? Colors.blueAccent
  //                     : (drinkCards[index].type == CardType.rule
  //                         ? Colors.green[600]
  //                         : (drinkCards[index].type == CardType.competition
  //                             ? Colors.red
  //                             : Colors.brown))),
  //             borderRadius: const BorderRadius.all(
  //               Radius.circular(25),
  //             ),
  //           ),
  //           child: Center(
  //             child: Text(
  //               drinkCards[index].type == CardType.challenge
  //                   ? 'CHALLENGE'
  //                   : (drinkCards[index].type == CardType.regular
  //                       ? 'NORMAL'
  //                       : (drinkCards[index].type == CardType.rule
  //                           ? 'RULE'
  //                           : (drinkCards[index].type == CardType.competition
  //                               ? 'COMPETITION'
  //                               : 'NORMAL'))),
  //               style: GoogleFonts.poppins(
  //                 fontSize: height * 0.049,
  //                 color: Colors.white.withOpacity(1),
  //                 fontWeight: FontWeight.w800,
  //               ),
  //             ),
  //           ),
  //         ),
  //         back: Container(
  //           width: width * 0.85,
  //           height: height * 0.25,
  //           decoration: const BoxDecoration(
  //             color: Color(0xff352f44),
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(25),
  //             ),
  //           ),
  //           child: Column(
  //             children: [
  //               Container(
  //                   padding: const EdgeInsets.only(
  //                     top: 10,
  //                   ),
  //                   height: height * 0.1,
  //                   width: width * 0.7,
  //                   child: Image.asset(
  //                       "assets/images/${drinkCards[index].type == CardType.challenge ? 'challenge.png' : (drinkCards[index].type == CardType.regular ? 'regular.png' : (drinkCards[index].type == CardType.rule ? 'rule.png' : (drinkCards[index].type == CardType.competition ? 'competition.png' : 'regular.png')))}")),
  //               Expanded(
  //                 child: Container(
  //                   padding: const EdgeInsets.only(
  //                     top: 25,
  //                   ),
  //                   width: width * 0.7,
  //                   child: Text(
  //                     text,
  //                     style: GoogleFonts.poppins(
  //                       fontSize: height * 0.02,
  //                       color: Colors.white.withOpacity(1),
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  //   return cards;
  // }
}
