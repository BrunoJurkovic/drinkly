import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drinkly/app/injection_container.dart';
import 'package:drinkly/decks/decks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DecksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DecksBloc>(),
      child: DecksView(),
    );
  }
}

class DecksView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff2a2438),
      appBar: buildAppBar(context, height),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                // AutoRouteNavigator.root.push(
                //   Routes.gameScreen,
                //   arguments: GameScreenArguments(id: 'standard'),
                // );
              },
              child: Container(
                height: height * 0.125,
                width: width * 0.8,
                child: Image.asset('assets/images/standard.png'),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                // ExtendedNavigator.root.push(
                //   Routes.gameScreen,
                //   arguments: GameScreenArguments(id: 'mixed'),
                // );
              },
              child: Container(
                height: height * 0.125,
                width: width * 0.8,
                child: Image.asset('assets/images/mixed.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, double height) {
    return AppBar(
      actions: [
        IconButton(
            icon: const Icon(CupertinoIcons.question_circle),
            onPressed: () {
              AwesomeDialog(
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
            }),
      ],
      elevation: 0,
      title: Text(
        'Pick a deck',
        style: GoogleFonts.poppins(
          fontSize: height * 0.03,
          color: Colors.white.withOpacity(0.65),
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: const Color(0xff2a2438),
    );
  }
}
