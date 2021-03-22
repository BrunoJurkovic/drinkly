import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:drinkly/app/injection_container.dart';
import 'package:drinkly/players/players.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:drinkly/l10n/l10n.dart';

class PlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PlayerCubit>(),
      child: PlayerView(),
    );
  }
}

class PlayerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final loc = context.l10n;
    var players = context.watch<PlayerCubit>().state;
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: const Color(0xff2a2438), // todo make this in own file.
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageContainer(width, height),
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
                    loc.who_is_playing,
                    style: GoogleFonts.poppins(
                      fontSize: height * 0.03,
                      color: Colors.pinkAccent[200]?.withOpacity(0.9),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.125),
              IconButton(
                icon: const Icon(CupertinoIcons.add),
                onPressed: () async {
                  await addPlayerAction(context);
                },
              ),
            ],
          ),
          PlayerListBody(height: height, width: width, players: players),
          SizedBox(height: height * 0.01),
          Center(
            child: Container(
              width: width * 0.7,
              height: height * 0.055,
              color: const Color(0xff411e8f),
              child: TextButton(
                onPressed: () {
                  if (players.length >= 2) {
                    // AutoRouter.of(context).push(); TODO PUSH TO DECK
                  } else {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.ERROR,
                      animType: AnimType.RIGHSLIDE,
                      title: loc.player_dialog_title,
                      desc: loc.player_dialog_body,
                      btnOkOnPress: () {},
                    )..show();
                  }
                },
                child: Text(
                  loc.player_lets_go,
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

  Container imageContainer(double width, double height) {
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

  Future<void> addPlayerAction(BuildContext context) async {
    final loc = context.l10n;
    final name = await showTextInputDialog(
      context: context,
      title: loc.add_player_dialog_title,
      style: AdaptiveStyle.material,
      textFields: [
        DialogTextField(
          keyboardType: TextInputType.name,
          hintText: loc.example_name,
        ),
      ],
    );
    name != null
        ? context.read<PlayerCubit>().addPlayer(name: name[0])
        : DoNothingAction();
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(30.0),
      child: AppBar(
        backgroundColor: const Color(0xff352f44),
        elevation: 0,
      ),
    );
  }
}

class PlayerListBody extends StatelessWidget {
  const PlayerListBody({
    Key? key,
    required this.height,
    required this.width,
    required this.players,
  }) : super(key: key);

  final double height;
  final double width;
  final List<Player> players;

  @override
  Widget build(BuildContext context) {
    final loc = context.l10n;
    return Center(
      child: Container(
        height: height * 0.3,
        width: width * 0.8,
        padding: const EdgeInsets.only(top: 25),
        child: players.isEmpty
            ? Center(
                child: Text(
                  loc.add_player_hint_text,
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
                  return PlayerListItem(
                    height: height,
                    players: context.watch<PlayerCubit>().state,
                    width: width,
                    index: index,
                  );
                },
              ),
      ),
    );
  }
}

class PlayerListItem extends StatelessWidget {
  const PlayerListItem({
    Key? key,
    required this.height,
    required this.players,
    required this.width,
    required this.index,
  }) : super(key: key);

  final double height;
  final List<Player> players;
  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: height * 0.0175),
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          context.read<PlayerCubit>().removePlayer(name: players[index].name);
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
                    context
                        .read<PlayerCubit>()
                        .removePlayer(name: players[index].name);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
