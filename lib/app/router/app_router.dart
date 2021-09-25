// 📦 Package imports:
import 'package:auto_route/auto_route.dart';

// 🌎 Project imports:
import '../../decks/presentation/pages/decks_page.dart';
import '../../game/presentation/pages/game_page.dart';
import '../../players/presentation/pages/player_page.dart';

@AdaptiveAutoRouter(
  routes: [
    AdaptiveRoute<dynamic>(page: PlayerPage, initial: true),
    AdaptiveRoute<dynamic>(page: DecksPage),
    AdaptiveRoute<dynamic>(page: GamePage),
  ],
)
class $AppRouter {}
