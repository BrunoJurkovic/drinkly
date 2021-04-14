import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app/router/app_router.gr.dart';
import '../cubit/player_cubit.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    /// We use provider to watch the state of the [PlayerCubit] and update
    /// the ui accordingly.
    var players = context.watch<PlayerCubit>().state;
    return Center(
      child: Container(
        width: width * 0.7,
        height: height * 0.055,
        color: const Color(0xff411e8f),
        child: TextButton(
          onPressed: () {
            if (players.length >= 2) {
              context.router.push(const DecksPageRoute());
            } else {
              // Ask the user to add more players (more than 1)
              showErrorDialog(context);
            }
          },
          child: buttonText(height),
        ),
      ),
    );
  }

  AwesomeDialog showErrorDialog(BuildContext context) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      animType: AnimType.RIGHSLIDE,
      title: 'Add at least 2 players.',
      desc: 'You have to add at least 2 players to begin the game.',
      btnOkOnPress: () {},
    )..show();
  }

  Text buttonText(double height) {
    return Text(
      "Let's go!",
      style: GoogleFonts.poppins(
        fontSize: height * 0.0275,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
