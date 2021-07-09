import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drinkly/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcard/tcard.dart';

import '../../../decks/domain/entities/drink_card.dart';
import '../../../decks/presentation/bloc/decks_bloc.dart';
import '../../../players/presentation/cubit/player_cubit.dart';
import '../bloc/game_bloc.dart';
import 'helper/build_cards.dart';

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
  var isLoaded = false;
  var cards = [];

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
      title: AppLocalizations.of(context)!.end_header,
      desc: AppLocalizations.of(context)!.end_body,
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
      AppLocalizations.of(context)!.add_2_players_error,
      style: GoogleFonts.poppins(
        fontSize: height * 0.03,
        color: Colors.white.withOpacity(0.65),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
