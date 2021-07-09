import 'package:drinkly/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cubit/player_cubit.dart';
import 'player_list_view.dart';

class PlayerDisplay extends StatelessWidget {
  const PlayerDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var players = context.watch<PlayerCubit>().state;
    return Center(
      child: Container(
        height: height * 0.3,
        width: width * 0.8,
        padding: const EdgeInsets.only(top: 25),
        child: players.isEmpty
            ? noPlayersDisplay(
                height,
                AppLocalizations.of(context)!
                    .add_some_players) // if there are no players, display text.
            : PlayerListView(
                players: players, // else show the user a list of players
              ),
      ),
    );
  }

  /// This is what shows when there are no players in the check above.
  Center noPlayersDisplay(double height, String text) {
    return Center(
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: height * 0.0275,
          color: Colors.white.withOpacity(0.7),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
