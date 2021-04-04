import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drinkly/app/dependency_injection.dart';
import 'package:drinkly/players/presentation/cubit/player_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// We have to wrap our custom [AppBar] widget with the
      /// [PreferredSize] because that's what the [appBar:] accepts.
      appBar: buildAppBar(),
      backgroundColor: const Color(0xff2a2438),
      body: const PlayerBody(),
    );
  }

  PreferredSize buildAppBar() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(30.0),
      child: PlayerAppBar(),
    );
  }
}

class PlayerBody extends StatelessWidget {
  const PlayerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => sl<PlayerCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DrinklyLogo(),
          SizedBox(height: height * 0.05),
          const AddPlayers(),
          const PlayerDisplay(),
          SizedBox(height: height * 0.01),
          const NextButton()
        ],
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var players = context.watch<PlayerCubit>().state;
    return Center(
      child: Container(
        width: width * 0.7,
        height: height * 0.055,
        color: const Color(0xff411e8f),
        child: TextButton(
          onPressed: () {
            if (players.length >= 2) {
              // ExtendedNavigator.root.push(Routes.decksScreen);
            } else {
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
            ? noPlayersDisplay(height)
            : ListView.builder(
                itemCount: players.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: height * 0.0175),
                    child: Dismissible(
                      key: UniqueKey(),
                      onDismissed: (_) {
                        removePlayerAction(context, players[index].name);
                      },
                      child: Container(
                        width: width * 0.7,
                        height: height * 0.055,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color(0xff352f44),
                        ),
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                players[index].name,
                                style: GoogleFonts.poppins(
                                  fontSize: height * 0.02,
                                  color: Colors.white.withOpacity(0.7),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: IconButton(
                                icon: const Icon(
                                  CupertinoIcons.xmark,
                                  size: 16,
                                ),
                                onPressed: () {
                                  removePlayerAction(
                                    context,
                                    players[index].name,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  Center noPlayersDisplay(double height) {
    return Center(
      child: Text(
        'Add some players!',
        style: GoogleFonts.poppins(
          fontSize: height * 0.0275,
          color: Colors.white.withOpacity(0.7),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class AddPlayers extends StatelessWidget {
  const AddPlayers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
              addPlayerAction(context);
            },
            child: whoIsPlayingText(height),
          ),
        ),
        SizedBox(width: width * 0.125),
        const PlusButton(),
      ],
    );
  }

  Text whoIsPlayingText(double height) {
    return Text(
      'Who is playing?',
      style: GoogleFonts.poppins(
        fontSize: height * 0.03,
        color: Colors.pinkAccent[200]?.withOpacity(0.9),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class PlusButton extends StatelessWidget {
  const PlusButton();
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

class DrinklyLogo extends StatelessWidget {
  const DrinklyLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height * 0.35,
      decoration: const BoxDecoration(
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
    );
  }
}

class PlayerAppBar extends StatelessWidget {
  const PlayerAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff352f44),
      elevation: 0,
    );
  }
}

void addPlayerAction(BuildContext context) async {
  final name = await showTextInputDialog(
    context: context,
    title: 'What is the player\'s name?',
    style: AdaptiveStyle.material,
    textFields: [
      const DialogTextField(
        keyboardType: TextInputType.name,
        hintText: 'John',
      ),
    ],
  );
  name != null
      ? context.read<PlayerCubit>().addPlayer(name[0])
      : DoNothingAction();
}

void removePlayerAction(BuildContext context, String name) {
  context.read<PlayerCubit>().removePlayer(name);
}
