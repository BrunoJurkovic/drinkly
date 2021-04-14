import 'package:auto_route/auto_route.dart';
import '../../decks/presentation/pages/decks_page.dart';
import '../../game/presentation/pages/game_page.dart';
import '../../players/presentation/pages/player_page.dart';

@AdaptiveAutoRouter(
  routes: [
    AdaptiveRoute(page: PlayerPage, initial: true),
    AdaptiveRoute(page: DecksPage),
    AdaptiveRoute(page: GamePage),
  ],
)
class $AppRouter {}
