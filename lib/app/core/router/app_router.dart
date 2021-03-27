import 'package:auto_route/annotations.dart';
import 'package:drinkly/decks/decks.dart';
import 'package:drinkly/game/view/games_screen.dart';
import 'package:drinkly/players/players.dart';

@AdaptiveAutoRouter(
  routes: [
    AdaptiveRoute(
      page: PlayerScreen,
      initial: true,
    ),
    AdaptiveRoute(page: DecksScreen),
    AdaptiveRoute(page: GamesScreen),
  ],
)
class $AppRouter {}
