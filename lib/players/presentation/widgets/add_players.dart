// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:drinkly/l10n/l10n.dart';
import '../cubit/player_cubit.dart';

class AddPlayers extends StatelessWidget {
  const AddPlayers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final localization = AppLocalizations.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              addPlayerAction(context);
            },
            // When the user taps the 'Who's playing' text, ask them
            // if they want to add a player.
            child: whoIsPlayingText(height, localization!.who_is_playing),
          ),
        ),
        SizedBox(width: width * 0.125),
        // Alternative method of adding players
        const PlusButton(),
      ],
    );
  }

  Text whoIsPlayingText(double height, String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: height * 0.03,
        color: Colors.pinkAccent[200]?.withOpacity(0.9),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class PlusButton extends StatelessWidget {
  const PlusButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(CupertinoIcons.add),
      onPressed: () {
        addPlayerAction(context);
      },
    );
  }
}

Future<void> addPlayerAction(BuildContext context) async {
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

  /// If the name of the player is not null, add it, else do nothing.
  name != null
      // ignore: use_build_context_synchronously
      ? context.read<PlayerCubit>().addPlayer(name[0])
      : DoNothingAction();
}

void removePlayerAction(BuildContext context, String name) {
  /// Removes the player from the state with provider.
  context.read<PlayerCubit>().removePlayer(name);
}
