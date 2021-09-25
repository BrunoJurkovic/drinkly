// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tcard/tcard.dart';

// 🌎 Project imports:
import 'package:drinkly/l10n/l10n.dart';
import '../../../players/domain/entities/player.dart';
import '../../../players/presentation/cubit/player_cubit.dart';

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
    final players = context.watch<PlayerCubit>().state;
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
              addPlayersButton(),
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
            title: AppLocalizations.of(context)!.whats_the_players_name,
            style: AdaptiveStyle.material,
            textFields: [
              DialogTextField(
                keyboardType: TextInputType.name,
                hintText: AppLocalizations.of(context)!.hint_text_name,
              ),
            ],
          );
          name != null
              ? stateSetter(() {
                  context.read<PlayerCubit>().addPlayer(name[0]);
                })
              : DoNothingAction();
          stateSetter(() {});
        });
  }

  Padding allPlayersText(double height) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
      child: Text(
        AppLocalizations.of(context)!.all_players,
        style: GoogleFonts.poppins(
          fontSize: height * 0.02,
          color: Colors.white.withOpacity(0.65),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
