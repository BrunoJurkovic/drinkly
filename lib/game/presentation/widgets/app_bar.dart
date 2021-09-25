// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:drinkly/l10n/l10n.dart';

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
      title: buildAppHeaderText(height, AppLocalizations.of(context)!.game_on),
      backgroundColor: const Color(0xff2a2438),
    );
  }

  Text buildAppHeaderText(double height, String text) {
    return Text(
      text,
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
            animType: AnimType.BOTTOMSLIDE,
            title: AppLocalizations.of(context)!.how_to_play,
            desc: AppLocalizations.of(context)!.tutorial_body,
            btnOkOnPress: () {},
          ).show();
        });
  }
}
