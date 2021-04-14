import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/decks_bloc.dart';
import 'list_view.dart';

class DeckPageBody extends StatelessWidget {
  const DeckPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: BlocBuilder<DecksBloc, DecksState>(
        builder: (context, state) {
          if (state is DecksInitial) {
            // We initialize the list of decks by calling the bloc
            // to get all decks.
            context.read<DecksBloc>().add(DecksGet());
          } else if (state is DecksLoaded) {
            // When the decks are retrieved, display the list of decks
            return DecksListView(
              decks: state.decks,
            );
          }
          // This should never happen, but it here
          // as a safety net
          return Container();
        },
      ),
    );
  }
}
