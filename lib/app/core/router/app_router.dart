import 'package:auto_route/annotations.dart';
import 'package:drinkly/players/players.dart';

@AdaptiveAutoRouter(
  routes: [
    AdaptiveRoute(
      page: PlayerScreen,
      initial: true,
    ),
  ],
)
class $AppRouter {}
