import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
