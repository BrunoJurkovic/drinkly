import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcard/tcard.dart';

import '../../app/injection_container.dart';
import '../../decks/decks.dart';
import '../../players/players.dart';
import '../bloc/game_bloc.dart';
import 'helper/build_cards.dart';

var selectedDeck;

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
      child: BlocListener<PlayerCubit, List<Player>>(
        listener: (context, state) {
          context.read<GameBloc>().add(GamePrepare(deck: deck, players: state));
        },
        child: GamesView(
          deck: deck,
        ),
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
    selectedDeck = widget.deck;
    return Scaffold(
      backgroundColor: const Color(0xff2a2438),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.075),
        child: GameAppBar(height: height),
      ),
      body: GameBody(
        deck: widget.deck,
      ),
    );
  }
}

class GameBody extends StatefulWidget {
  const GameBody({
    Key? key,
    required this.deck,
  }) : super(key: key);

  final DeckType deck;

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
              : CardStack(
                  controller: _controller,
                  callback: callback,
                  index: frontCardIndex,
                  deck: widget.deck,
                ),
        ),
        Expanded(
          child: SafeArea(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                child: BlocBuilder<GameBloc, GameState>(
                  builder: (context, state) {
                    if (state is GameLoaded) {
                      return IconButton(
                        onPressed: () async {
                          await showModalBottomSheet(
                            context: context,
                            builder: (ctx) {
                              return MultiBlocProvider(
                                providers: [
                                  BlocProvider(
                                    create: (ctx) => sl<PlayerCubit>(),
                                  ),
                                  BlocProvider(
                                    create: (ctx) => sl<GameBloc>(),
                                  ),
                                ],
                                child: ModalSheetBody(
                                  height: height,
                                  controller: _controller,
                                  index: _controller.index,
                                  callback: () {
                                    var cards = CardHelper.buildCardItems(
                                      state.cards.sublist(_controller.index),
                                      context,
                                    );
                                    setState(() {
                                      _controller.reset(
                                        cards: cards,
                                      );
                                    });
                                  },
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          CupertinoIcons.person_add_solid,
                          size: 34,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ModalSheetBody extends StatelessWidget {
  ModalSheetBody({
    Key? key,
    required this.height,
    required TCardController controller,
    required this.index,
    required this.callback,
  })   : _controller = controller,
        super(key: key);

  final double height;
  final TCardController _controller;
  final int index;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (ctx, stateSetter) {
        var players = ctx.watch<PlayerCubit>().state;
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
                          ? stateSetter(
                              () {
                                context.read<PlayerCubit>().state.add(
                                      Player(
                                        name: name[0],
                                      ),
                                    );
                                context.read<GameBloc>().add(
                                      GameReloaded(
                                        deck: selectedDeck,
                                      ),
                                    );
                                callback();
                              },
                            )
                          : DoNothingAction();
                    },
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: players.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (ctx, ind) {
                    return Chip(
                      key: UniqueKey(),
                      onDeleted: () {
                        stateSetter(() {
                          context.read<GameBloc>().playerCubit.removePlayer(
                                name: players[ind].name,
                              );
                        });
                        context.read<GameBloc>().add(
                              GameReloaded(
                                deck: selectedDeck,
                              ),
                            );
                        callback();
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
        );
      },
    );
  }
}

class CardStack extends StatefulWidget {
  const CardStack({
    Key? key,
    required this.callback,
    required TCardController controller,
    required this.index,
    required this.deck,
  })   : _controller = controller,
        super(key: key);

  final TCardController _controller;
  final Function callback;
  final int index;
  final DeckType deck;

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
        context.read<GameBloc>().add(
              GamePrepare(
                deck: widget.deck,
                players: [
                  Player(name: 'a'),
                  Player(name: 'b'),
                ],
              ),
            );
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
      cards: [...CardHelper.buildCardItems(state.cards, context)],
    );
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
