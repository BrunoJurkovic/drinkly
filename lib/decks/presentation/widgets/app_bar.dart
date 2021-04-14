import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DecksAppBar extends StatelessWidget {
  const DecksAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return AppBar(
      actions: [
        buildTutorial(context),
      ],
      elevation: 0,
      title: buildDeckPickerText(height),
      backgroundColor: const Color(0xff2a2438),
    );
  }

  Text buildDeckPickerText(double height) {
    return Text(
      'Pick a deck',
      style: GoogleFonts.poppins(
        fontSize: height * 0.03,
        color: Colors.white.withOpacity(0.65),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  IconButton buildTutorial(BuildContext context) {
    return IconButton(
        icon: const Icon(CupertinoIcons.question_circle),
        onPressed: () {
          buildTutorialDialog(context);
        });
  }

  AwesomeDialog buildTutorialDialog(BuildContext context) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.BOTTOMSLIDE,
      title: 'How to play?',
      desc: '''
The standard card deck only includes
the regular type of cards. 
The mixed card deck includes standard, mixed
challenges and competition type cards.
The recommended deck for the best experience
is the standard deck type.''',
      btnOkOnPress: () {},
    )..show();
  }
}
