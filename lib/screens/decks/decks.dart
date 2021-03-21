import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drinkly/router/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DecksScreen extends StatefulWidget {
  @override
  _DecksScreenState createState() => _DecksScreenState();
}

class _DecksScreenState extends State<DecksScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff2a2438),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.question_circle),
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
        backgroundColor: Color(0xff2a2438),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                ExtendedNavigator.root.push(
                  Routes.gameScreen,
                  arguments: GameScreenArguments(id: 'standard'),
                );
              },
              child: Container(
                height: height * 0.125,
                width: width * 0.8,
                child: Image.asset('assets/images/standard.png'),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                ExtendedNavigator.root.push(
                  Routes.gameScreen,
                  arguments: GameScreenArguments(id: 'mixed'),
                );
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
}
