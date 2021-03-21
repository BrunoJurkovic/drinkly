import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drinkly/models/player.dart';
import 'package:drinkly/router/router.gr.dart';
import 'package:drinkly/services/game_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Player> players = [];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    players = Provider.of<GameLogic>(context).players;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Color(0xff352f44),
          elevation: 0,
          // actions: [
          //   IconButton(icon: Icon(CupertinoIcons.settings), onPressed: () {})
          // ],
        ),
      ),
      backgroundColor: Color(0xff2a2438),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: height * 0.35,
            decoration: BoxDecoration(
              color: Color(0xff352f44),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150),
              ),
            ),
            child: Center(
              child: Container(
                height: height * 0.27,
                width: width * 0.7,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () async {
                    await addPlayerAction(context);
                  },
                  child: Text(
                    'Who is playing?',
                    style: GoogleFonts.poppins(
                      fontSize: height * 0.03,
                      color: Colors.pinkAccent[200].withOpacity(0.9),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.125),
              IconButton(
                icon: Icon(CupertinoIcons.add),
                onPressed: () async {
                  await addPlayerAction(context);
                },
              ),
            ],
          ),
          Center(
            child: Container(
              height: height * 0.3,
              width: width * 0.8,
              padding: EdgeInsets.only(top: 25),
              child: players.isEmpty
                  ? Center(
                      child: Text(
                        'Add some players!',
                        style: GoogleFonts.poppins(
                          fontSize: height * 0.0275,
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: players.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: height * 0.0175),
                          child: Dismissible(
                            key: UniqueKey(),
                            onDismissed: (_) {
                              Provider.of<GameLogic>(context, listen: false)
                                  .removePlayer(players[index]);
                            },
                            child: Container(
                              width: width * 0.7,
                              height: height * 0.055,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Color(0xff352f44),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                players[index].name,
                                style: GoogleFonts.poppins(
                                  fontSize: height * 0.02,
                                  color: Colors.white.withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
          SizedBox(height: height * 0.01),
          Center(
            child: Container(
              width: width * 0.7,
              height: height * 0.055,
              color: Color(0xff411e8f),
              child: TextButton(
                onPressed: () {
                  if (players.length >= 2) {
                    ExtendedNavigator.root.push(Routes.decksScreen);
                  } else {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.ERROR,
                      animType: AnimType.RIGHSLIDE,
                      title: 'Add at least 2 players.',
                      desc:
                          'You have to add at least 2 players to begin the game.',
                      btnOkOnPress: () {},
                    )..show();
                  }
                },
                child: Text(
                  "Let's go!",
                  style: GoogleFonts.poppins(
                    fontSize: height * 0.0275,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

addPlayerAction(BuildContext context) async {
  final name = await showTextInputDialog(
    context: context,
    title: 'What is the player\'s name?',
    style: AdaptiveStyle.material,
    textFields: [
      DialogTextField(
        keyboardType: TextInputType.name,
        hintText: 'John',
      ),
    ],
  );
  name != null
      ? Provider.of<GameLogic>(context, listen: false).addPlayer(
          Player(
            name: name[0],
          ),
        )
      : DoNothingAction();
}
