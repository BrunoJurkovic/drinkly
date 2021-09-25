// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import '../../../app/router/app_router.gr.dart';
import '../../domain/entities/deck.dart';
import '../bloc/decks_bloc.dart';
import 'decks_item.dart';

class DecksListView extends StatelessWidget {
  const DecksListView({
    Key? key,
    required this.decks,
  }) : super(key: key);

  final List<Deck> decks;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DeckItem(
          callback: () async {
            await context.router
                .push(
              GamePageRoute(
                  deck: decks.firstWhere(
                      (element) => element.deckType == DeckType.standard)),
            )
                .then((value) {
              context.read<DecksBloc>().add(DecksGet());
            });
          },
          imageUri: 'assets/images/standard.png',
        ),
        const SizedBox(
          height: 25,
        ),
        DeckItem(
          callback: () async {
            await context.router
                .push(
              GamePageRoute(
                  deck: decks.firstWhere(
                      (element) => element.deckType == DeckType.mixed)),
            )
                .then((value) {
              context.read<DecksBloc>().add(DecksGet());
            });
          },
          imageUri: 'assets/images/mixed.png',
        ),
      ],
    );
  }
}
