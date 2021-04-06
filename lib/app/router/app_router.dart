import 'package:auto_route/auto_route.dart';
import 'package:drinkly/decks/presentation/pages/decks_page.dart';
import 'package:drinkly/game/presentation/pages/game_page.dart';
import 'package:drinkly/players/presentation/pages/player_page.dart';

@AdaptiveAutoRouter(
  routes: [
    AdaptiveRoute(page: PlayerPage, initial: true),
    AdaptiveRoute(page: DecksPage),
    AdaptiveRoute(page: GamePage),
  ],
)
class $AppRouter {}
