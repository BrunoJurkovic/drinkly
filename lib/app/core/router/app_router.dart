import 'package:auto_route/annotations.dart';
import 'package:drinkly/decks/decks.dart';
import 'package:drinkly/players/players.dart';

@AdaptiveAutoRouter(
  routes: [
    AdaptiveRoute(
      page: PlayerScreen,
      initial: true,
    ),
    AdaptiveRoute(page: DecksScreen)
  ],
)
class $AppRouter {}
