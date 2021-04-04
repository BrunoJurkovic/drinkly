import 'package:auto_route/auto_route.dart';
import 'package:drinkly/players/presentation/pages/player_page.dart';

@AdaptiveAutoRouter(
  routes: [
    AdaptiveRoute(page: PlayerPage, initial: true),
  ],
)
class $AppRouter {}
