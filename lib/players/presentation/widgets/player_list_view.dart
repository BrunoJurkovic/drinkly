// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import '../../domain/entities/player.dart';
import 'add_players.dart';

class PlayerListView extends StatelessWidget {
  const PlayerListView({
    Key? key,
    required this.players,
  }) : super(key: key);

  final List<Player> players;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (ctx, index) {
        return Padding(
          padding: EdgeInsets.only(top: height * 0.0175),

          /// We wrap the list items in a dismissible so that the user can
          /// easily remove the players by swiping right
          child: Dismissible(
            key: UniqueKey(),
            onDismissed: (_) {
              removePlayerAction(context, players[index].name);
            },
            child: playerListItem(width, height, index, context),
          ),
        );
      },
    );
  }

  Container playerListItem(
    double width,
    double height,
    int index,
    BuildContext context,
  ) {
    return Container(
      width: width * 0.7,
      height: height * 0.055,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xff352f44),
      ),
      alignment: Alignment.center,

      /// We use a stack because that provides perfect center
      /// alignment
      child: Stack(
        children: [
          playerNameText(index, height),
          removePlayerButton(context, index),
        ],
      ),
    );
  }

  Center playerNameText(int index, double height) {
    return Center(
      child: Text(
        players[index].name,
        style: GoogleFonts.poppins(
          fontSize: height * 0.02,
          color: Colors.white.withOpacity(0.7),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Positioned removePlayerButton(BuildContext context, int index) {
    return Positioned(
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
    );
  }
}
