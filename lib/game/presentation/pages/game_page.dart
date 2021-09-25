// 🐦 Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcard/tcard.dart';

// 🌎 Project imports:
import 'package:drinkly/app/dependency_injection.dart';
import 'package:drinkly/decks/domain/entities/deck.dart';
import 'package:drinkly/game/presentation/widgets/app_bar.dart';
import 'package:drinkly/game/presentation/widgets/body.dart';
import 'package:drinkly/game/presentation/widgets/modal_body.dart';
import 'package:drinkly/players/presentation/cubit/player_cubit.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key, required this.deck}) : super(key: key);
  final Deck deck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: GameAppBar(),
      ),
      backgroundColor: const Color(0xff2a2438),
      body: GameBody(deck: deck),
    );
  }
}

Future<void> buildModalBottomSheet(
  BuildContext context,
  double height,
  TCardController controller,
) async {
  await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return BlocProvider(
          create: (context) => sl<PlayerCubit>(),
          child: StatefulBuilder(
            builder: (ctx, stateSetter) => ModalBody(
              stateSetter: stateSetter,
              context: context,
              controller: controller,
            ),
          ),
        );
      });
}
