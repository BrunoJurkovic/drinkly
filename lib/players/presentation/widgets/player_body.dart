// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// 🌎 Project imports:
import '../../../app/dependency_injection.dart';
import '../cubit/player_cubit.dart';
import 'add_players.dart';
import 'drinkly_logo.dart';
import 'next_button.dart';
import 'player_display.dart';

class PlayerBody extends StatelessWidget {
  const PlayerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    /// We provide the [PlayerCubit] to the rest of the widget
    /// tree as it is needed pretty much everywhere
    return BlocProvider(
      create: (_) => sl<PlayerCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App logo at the top
          const DrinklyLogo(),
          SizedBox(height: height * 0.05),
          // Add players button and text
          const AddPlayers(),

          /// List of players
          const PlayerDisplay(),
          SizedBox(height: height * 0.01),
          // Button to move to deck screen
          const NextButton()
        ],
      ),
    );
  }
}
