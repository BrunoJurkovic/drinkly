import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcard/tcard.dart';

import '../../../app/dependency_injection.dart';
import '../../../decks/domain/entities/deck.dart';
import '../../../players/presentation/cubit/player_cubit.dart';
import '../widgets/app_bar.dart';
import '../widgets/body.dart';
import '../widgets/modal_body.dart';

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

void buildModalBottomSheet(
  BuildContext context,
  double height,
  TCardController controller,
) async {
  await showModalBottomSheet(
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
