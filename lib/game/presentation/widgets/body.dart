// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcard/tcard.dart';

// 🌎 Project imports:
import '../../../app/dependency_injection.dart';
import '../../../decks/domain/entities/deck.dart';
import '../../../decks/presentation/bloc/decks_bloc.dart';
import '../../../players/domain/entities/player.dart';
import '../../../players/presentation/cubit/player_cubit.dart';
import '../bloc/game_bloc.dart';
import 'add_players_button.dart';
import 'card_counter.dart';
import 'card_game.dart';
import 'helper/build_cards.dart';

class GameBody extends StatefulWidget {
  const GameBody({Key? key, required this.deck}) : super(key: key);

  final Deck deck;

  @override
  _GameBodyState createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  int frontCardIndex = 0;
  TCardController controller = TCardController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: sl<PlayerCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<GameBloc>(),
        ),
        BlocProvider.value(
          value: sl<DecksBloc>(),
        ),
      ],
      child: BlocListener<PlayerCubit, List<Player>>(
        listener: (context, state) {
          context.read<DecksBloc>().add(DecksGet());
          context.read<GameBloc>().add(
                GameInitialize(players: state, cards: widget.deck.cards),
              );
          final gameState = context.read<GameBloc>().state;
          if (gameState is GameLoaded) {
            final cards =
                buildCardItems(widget.deck.cards, context, gameState.cards);
            controller.reset(
              cards: <Widget>[...cards.sublist(frontCardIndex)],
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.15),
            CardCountWidget(frontCardIndex: frontCardIndex),
            CardGame(
              controller: controller,
              updateIndex: _updateIndex,
              cards: widget.deck.cards,
            ),
            AddPlayerSheetButton(
              controller: controller,
              frontCardIndex: frontCardIndex,
            ),
          ],
        ),
      ),
    );
  }

  void _updateIndex() {
    setState(() {
      frontCardIndex++;
    });
  }
}
