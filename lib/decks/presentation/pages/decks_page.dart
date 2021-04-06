import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drinkly/app/router/app_router.gr.dart';
import 'package:drinkly/decks/domain/entities/deck.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';

class DecksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        child: DecksAppBar(),
        preferredSize: Size.fromHeight(50),
      ),
      body: DeckPageBody(),
      backgroundColor: Color(0xff2a2438),
    );
  }
}

class DeckPageBody extends StatelessWidget {
  const DeckPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ListView(
        children: [
          DeckItem(
            callback: () {
              context.router.push(
                GamePageRoute(deckType: DeckType.standard),
              );
            },
            imageUri: 'assets/images/standard.png',
          ),
          const SizedBox(
            height: 25,
          ),
          DeckItem(
            callback: () {
              context.router.push(
                GamePageRoute(deckType: DeckType.mixed),
              );
            },
            imageUri: 'assets/images/mixed.png',
          ),
        ],
      ),
    );
  }
}

class DeckItem extends StatelessWidget {
  const DeckItem({Key? key, required this.imageUri, required this.callback})
      : super(key: key);

  final String imageUri;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      // ignore: unnecessary_lambdas
      onTap: () => callback(),
      child: Container(
        height: height * 0.125,
        width: width * 0.8,
        child: Image.asset(imageUri),
      ),
    );
  }
}

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
